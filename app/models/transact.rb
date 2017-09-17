class Transact < ApplicationRecord
  belongs_to :employee
  belongs_to :token
  belongs_to :company
  belongs_to :third_party_vendor
  has_many :transaction_details, dependent: :destroy
end
