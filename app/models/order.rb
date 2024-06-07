class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :employee
  has_many :product_details
  has_many :pizza_details

  STATUS_VALUES = {
    P: :preparation,
    R: :route,
    D: :delivered
  }

  def pizza_total
    total = pizza_details.pluck(:quantity, :unit_price).map{ |record| record[0] * record[1] }.sum
    "#{total.round(2)}$"
  end

  def prodcut_total
    total = product_details.pluck(:quantity, :unit_price).map{ |record| record[0] * record[1] }.sum
    "#{total.round(2)}$"
  end

  def status_name
    I18n.translate(STATUS_VALUES[status.to_sym])
  end

  def total_display
    "#{total.round(2)}$"
  end
end
