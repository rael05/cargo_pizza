class Customer < ApplicationRecord
    def full_name
        [name, last_name].join(" ")
    end
end
