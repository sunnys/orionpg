class Account < ApplicationRecord
  belongs_to :company
  has_many :operations, dependent: :destroy

  def credit(amount)
    self.total = self.total + amount
    self.operations.create!(amount: amount, type: "cr")
    self.save!
  end

  def debit(amount)
    self.totoal = self.total - amount
    self.operations.create!(amount: amount, type: "dr")
    self.save!
  end
end
