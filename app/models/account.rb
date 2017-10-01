class Account < ApplicationRecord
  belongs_to :company

  def credit(amount)
    self.amount = self.amount + amount
    self.save!
  end

  def debit(amount)
    self.amount = self.amount - amount
    self.save!
  end
end
