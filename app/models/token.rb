class Token < ApplicationRecord
  belongs_to :employee
  has_one :transact

  def validate_token
    if self.transaction_token_created_at
    end
  end
end
