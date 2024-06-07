class PizzaPart < ApplicationRecord
    has_many :pizza_details

    translates :name, :description

    validate :category_validator

    CATEGORIES_NAME = {
        S: :pizza_size,
        F: :pizza_flavor,
        B: :pizza_border
    }

    def category_name
        I18n.translate(CATEGORIES_NAME[category.to_sym])
    end

    def category_validator
        if CATEGORIES_NAME[category.to_sym].nil?
            errors.add(:category, I18n.translate(:category_error))
        end
    end

    def category_with_name
        category_name + ": " + name
    end
end
