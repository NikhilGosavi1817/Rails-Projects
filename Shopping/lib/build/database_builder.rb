module Build
    class DatabaseBuilder
        def self.reset_data
            Cart.destroy_all
            Product.destroy_all
            User.destroy_all
        end

        def self.create_products(count)
            count.times do |i|
                Product.create(
                    name: Faker::Commerce.product_name,
                    quantity: Faker::Number.between(from: 5, to: 10),
                    price: Faker::Number.between(from: 100, to: 200)
                )
            end
        end

        def self.create_users
            User.create(
                    email: "nikhil@gmail.com",
                    password: "nikhil18",
                )
        end

        def self.execute
            reset_data
            create_users
            create_products(5)
        end

        def self.run
            execute
        end
    end
end