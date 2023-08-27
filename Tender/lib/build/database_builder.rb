module Build
    class DatabaseBuilder
        def self.reset_data
            Transfer.destroy_all
            Benficary.destroy_all
            Account.destroy_all
            User.destroy_all
        end

        def self.create_accounts(count)
            count.times do |i|
                Account.create(
                    account_number: Faker::Number.unique.number(digits: 10),
                    name: Faker::Name.name
                )
            end
        end

        def self.create_users
            User.create(
                    email: "nikhil@gmail.com",
                    password: "nikhil18",
                    funds: 10000
                )
        end

        def self.execute
            reset_data
            create_users
            create_accounts(10)
        end

        def self.run
            execute
        end
    end
end