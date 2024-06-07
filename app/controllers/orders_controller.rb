class OrdersController < ApplicationController
    before_action :breadCrumb

    def index
    end

    def new
        @customer_list = Customer.limit(10).select(:id, :name, :last_name, :phone, :mail)
        @product_list = Product.pluck(:id, :name)
        @size_list = PizzaPart.where(category: "S").pluck(:id, :name)
        @pizza_flavors = PizzaPart.where(category: "F").pluck(:id, :name)
        @pizza_borders = PizzaPart.where(category: "B").pluck(:id, :name)
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

    def serach_by_customer
        if params[:customer_id].present?
            @customer = Customer.find(params[:customer_id])
        end
    end

    private
    def breadCrumb
        @breadCrumb = t(:orders)
    end
end