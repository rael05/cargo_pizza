class OrdersController < ApplicationController
    load_and_authorize_resource
    before_action :breadCrumb

    def index
    end

    def new
        @customer_list = Customer.limit(10).select(:id, :name, :last_name, :phone, :mail)
        @product_list = Product.pluck(:id, :name)
        @size_list = PizzaPart.where(category: "S").pluck(:id, :name)
        @pizza_flavors = PizzaPart.where(category: "F").pluck(:id, :name)
        @pizza_borders = PizzaPart.where(category: "B").pluck(:id, :name)
        @order = Order.new
    end

    def size_info
        @size_info = PizzaPart.find_by(id: params[:size_id])
    end

    def product_info
        @product_info = Product.find_by(id: params[:product_id])
    end

    def customer_info
        @customer_info = Customer.find_by(id: params[:customer_id])
    end

    def search_customers
        @customer_search = Customer.where('lower(name) LIKE :search OR lower(last_name) LIKE :search OR lower(phone) LIKE :search OR lower(mail) LIKE :search', search: "%#{params[:search_value]}%".downcase)
    end

    def show
        @current_order = Order.find(params[:order_id])
    end

    def search_by_customer
        if params[:customer_id].present?
            @customer = Customer.find(params[:customer_id])
        end
        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "#{@customer.name}_#{@customer.last_name}_#{DateTime.now.strftime("%d/%m/%Y_%I:%M:%s")}"
            end
        end
    end

    def create
        @order = Order.new(order_params)
        unless @order.save!
            render :new, status: :unprocessable_entity
            return
        end
        order_total = 0
        product_details_params.each do |product|
            product_detail = ProductDetail.new(product.permit(:product_id, :quantity))
            product_detail.order = @order
            product_detail.unit_price = Product.find(product_detail.product_id).price
            product_detail.sub_total = product_detail.unit_price * product_detail.quantity
            unless product_detail.save!
                @order.destroy
                render :new, status: :unprocessable_entity
                return
            end
            order_total += product_detail.sub_total
        end
        pizza_details_params.each do |pizza|
            pizza_detail = PizzaDetail.new(pizza.permit(:pizza_part_id, :quantity))
            pizza_detail.order = @order
            pizza_detail.unit_price = PizzaPart.find(pizza_detail.pizza_part_id).price
            pizza_detail.sub_total = pizza_detail.unit_price * pizza_detail.quantity
            unless pizza_detail.save!
                @order.destroy
                render :new, status: :unprocessable_entity
                return
            end
            order_total += pizza_detail.sub_total
        end
        unless @order.update!(total: order_total)
            @order.destroy
            render :new, status: :unprocessable_entity
            return
        end
        redirect_to show_order_path(@order), notice: "Product was successfully created."
    end

    private
    def breadCrumb
        @breadCrumb = t(:orders)
    end

    def order_params
        #total
        params.require(:order).permit(:customer_id, :employee_id)
    end

    def product_details_params
        params.require(:product_detail)
    end

    def pizza_details_params
        params.require(:pizza_detail)
    end
end