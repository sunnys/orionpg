class Account < ApplicationRecord
  belongs_to :company
  has_many :operations, dependent: :destroy

  def credit(amount)
    self.total = self.total + amount
    self.operations.create!(amount: amount, tr_type: "cr")
    self.save!
  end

  def debit(amount)
    self.total = self.total - amount
    self.operations.create!(amount: amount, tr_type: "dr")
    self.save!
  end
  
end
