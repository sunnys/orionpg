class Employee < User
  belongs_to :company
  has_many :transacts
  has_many :tokens
  #has_many :inverse_reporting_structures, class_name: "ReportingStructure", foreign_key: "reportee_id"
  #has_many :managers, through: :inverse_reporting_structures, source: :user

  def create_token
    require 'SecureRandom'
    self.tokens.create!(transaction_token: SecureRandom.uuid, transaction_token_created_at: Time.now)
  end

  def create_transaction(token_id, flight_info)
    if !token_id.nil?
      token = Token.find(token_id)
    else
      token = self.create_token
    end
    transact = self.transacts.create!(token_id: token_id, company_id: self.company.id, third_pary_vendor_id: flight_info.vendor_id, transaction_token: (token.nil? ? token.transaction_token : ""), transaction_token_created_at: token.transaction_token_created_at)
    transact.transaction_details.create!({type: flight_info.type, transaction_id: transact.id, source: flight_info.source, destination: flight_info.destination, amount: flight_info.amount, confirmed: flight_info.confirmed})
  end

  def recreate_token(transact_id)
    require 'SecureRandom'
    token = self.tokens.create!(transaction_token: SecureRandom.uuid, transaction_token_created_at: Time.now)
    transact = Transact.find(transact_id)
    transact.token_id = token.id
    transact.transaction_token = token.transaction_token
    transact.transaction_token_created_at = token.transaction_token_created_at
    transact.save!
    token
  end
end