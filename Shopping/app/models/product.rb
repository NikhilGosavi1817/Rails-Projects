class Product < ApplicationRecord
    has_many :carts

    def available_quantity
        if Cart.exists?(:name)
            quantity - carts[0].items
        else
            quantity
        end
    end
end
