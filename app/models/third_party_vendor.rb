class ThirdPartyVendor < ApplicationRecord
  belongs_to :company
  has_one :account, dependent: :destroy
  has_many :transacts
  has_many :third_party_employee, dependent: :destroy
end
