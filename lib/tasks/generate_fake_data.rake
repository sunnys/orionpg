namespace :generate_fake_data do
    desc "Create a company"
    require 'ffaker'
    task :create_companies => :environment do
        5.times do 
            Company.create!(name: FFaker::Company.name, address: FFaker::Address.city)
        end
    end

    desc "Create Employee of the companies"
    require 'ffaker'
    task :create_employees => :environment do
        Company.all.each_with_index do |company, index|
            email = "#{FFaker::Internet.user_name}#{index}@#{FFaker::Internet.domain_name}"
            p email
            m_user = User.create!(email: email, password: "password", password_confirmation: "password", uid: email, provider: "manual")
            manager = Employee.create!(company_id: company.id, user_id: m_user.id, email: m_user.email)
            Random.new.rand(5..10).times do |i|
                email1 = "#{FFaker::Internet.user_name}{i+50}@#{FFaker::Internet.domain_name}"
                user = User.create!(email: email1, password: "password", password_confirmation: "password", uid: email1, provider: "manual")
                manager.reportees.create!(company_id: company.id, user_id: user.id, email: user.email)
            end
        end
    end

    desc "Create Fake Flight information"
    require 'ffaker'
    task :create_flight_informations => :environment do
        Company.all.each_with_index do |company, index|
            5.times do 
                vendor = ThirdPartyVendor.create!(name: FFaker::Company.name, address: FFaker::Address.city, company_id: company.id)
                FlightInformation.create!({third_party_vendor_id: vendor.id, name: "Indigo", source: "Mumbai", destination: "Delhi", source_code: "BOM", destination_code: "DEL", amount: "5000.0", two_way: true, refundable: true, journey_date: Date.today + 20, journey_time: Time.now, travel_time: 2.0})
                FlightInformation.create!({third_party_vendor_id: vendor.id, name: "Indigo", source: "Mumbai", destination: "Delhi", source_code: "BOM", destination_code: "DEL", amount: "9000.0", two_way: true, refundable: true, journey_date: Date.today + 20, journey_time: Time.now, travel_time: 2.0})
                FlightInformation.create!({third_party_vendor_id: vendor.id, name: "Indigo", source: "Mumbai", destination: "Delhi", source_code: "BOM", destination_code: "DEL", amount: "7000.0", two_way: true, refundable: true, journey_date: Date.today + 20, journey_time: Time.now, travel_time: 2.0})
                FlightInformation.create!({third_party_vendor_id: vendor.id, name: "Indigo", source: "Mumbai", destination: "Delhi", source_code: "BOM", destination_code: "DEL", amount: "15000.0", two_way: true, refundable: true, journey_date: Date.today + 20, journey_time: Time.now, travel_time: 2.0})
                FlightInformation.create!({third_party_vendor_id: vendor.id, name: "Indigo", source: "Mumbai", destination: "Delhi", source_code: "BOM", destination_code: "DEL", amount: "10000.0", two_way: true, refundable: true, journey_date: Date.today + 20, journey_time: Time.now, travel_time: 2.0})
            end
        end
    end

    desc "Create company accounts"
    task :create_company_account => :environment do
        Company.all.each_with_index do |company, index| 
            Account.create!(company_id: company.id, name: "account", total: 1000000.0, unpaid: 0.0, paid: 0.0)
        end

        ThirdPartyVendor.all.each_with_index do |vendor, index|
            Account.create!(third_party_vendor_id: vendor.id, name: "account", total: 0.0, unpaid: 0.0, paid: 0.0)
        end
    end
end
