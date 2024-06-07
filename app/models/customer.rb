class Customer < ApplicationRecord
    has_many :orders

    def full_name
        [name, last_name].join(" ")
    end
end
