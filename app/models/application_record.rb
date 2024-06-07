class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def phone_display
    "+505 #{phone[1,4]} #{phone[4..]}"
  end

  def unit_price_display
    "#{unit_price.round(2)}$"
  end

  def sub_total_display
    "#{sub_total.round(2)}$"
  end
end
