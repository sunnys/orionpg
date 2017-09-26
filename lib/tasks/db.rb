namespace :db do
    namespace :seed do
        desc "Create a company"
        require 'ffaker'
        task :create_companies => :environment do
            5.times do 
                Company.create!(name: Faker::Company.name, address: Faker::Address.city)
            end
        end
    end
end