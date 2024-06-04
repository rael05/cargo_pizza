class PizzaPartsController < ApplicationController
  before_action :set_pizza_part, only: %i[ show edit update destroy ]
  before_action :categories_for_pizzas, only: %i[ new edit ]

  # GET /pizza_parts or /pizza_parts.json
  def index
    if params[:category].present?
      @pizza_title = t(PizzaPart::CATEGORIES_NAME[params[:category].to_sym])
      @pizza_parts = PizzaPart.where(category: params[:category])
      return
    end
    @pizza_title = t(:pizza_part)
    @pizza_parts = PizzaPart.all
  end

  # GET /pizza_parts/1 or /pizza_parts/1.json
  def show
  end

  # GET /pizza_parts/new
  def new
    @pizza_part = PizzaPart.new
    @action_name = t(:create_pizza_part)
  end

  # GET /pizza_parts/1/edit
  def edit
    @action_name = t(:update_pizza_part)
  end

  # POST /pizza_parts or /pizza_parts.json
  def create
    @pizza_part = PizzaPart.new(pizza_part_params)

    respond_to do |format|
      if @pizza_part.save
        format.html { redirect_to pizza_part_url(@pizza_part), notice: "Pizza part was successfully created." }
        format.json { render :show, status: :created, location: @pizza_part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pizza_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizza_parts/1 or /pizza_parts/1.json
  def update
    respond_to do |format|
      if @pizza_part.update(pizza_part_params)
        format.html { redirect_to pizza_part_url(@pizza_part), notice: "Pizza part was successfully updated." }
        format.json { render :show, status: :ok, location: @pizza_part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pizza_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizza_parts/1 or /pizza_parts/1.json
  def destroy
    @pizza_part.destroy!

    respond_to do |format|
      format.html { redirect_to pizza_parts_url, notice: "Pizza part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza_part
      @pizza_part = PizzaPart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pizza_part_params
      params.require(:pizza_part).permit(:name, :description, :price, :category)
    end

    def categories_for_pizzas
      @categories_array = PizzaPart::CATEGORIES_NAME.map { |key, value| [t(value), key] }
    end
end
