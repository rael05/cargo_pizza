class PizzaDetail < ApplicationRecord
  belongs_to :pizza_part
  belongs_to :order

  def quantity_display
    if pizza_part.category == "F"
      return "#{quantity * 100}%"
    end
    quantity
  end
end
