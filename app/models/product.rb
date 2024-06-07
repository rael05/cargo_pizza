class Product < ApplicationRecord
    has_many :product_details
    translates :name, :description
end
