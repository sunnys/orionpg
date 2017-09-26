class Account < ApplicationRecord
  belongs_to :company

  def credit(amount)
  end

  def debit(amount)
  end
end
