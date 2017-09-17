class Company < ApplicationRecord
    has_one :account, dependent: :destroy
    has_many :third_party_vendors, dependent: :destroy
    has_many :employees
    has_many :transacts

    accepts_nested_attributes_for :account

end
