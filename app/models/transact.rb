class Transact < ApplicationRecord
  belongs_to :employee
  belongs_to :token
  belongs_to :company
  belongs_to :third_party_vendor
  has_many :transaction_details, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def commit_transact
    company = self.employee.company
    company.account.debit(self.transaction_details.last.amount)
  end

  def pay_for_transaction
    company = self.employee.company
    company.account.debit(self.transaction_details.last.amount)
  end
end
