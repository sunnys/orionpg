class Employee < ActiveRecord::Base
  belongs_to :company, :class_name => "Company", :foreign_key => "company_id"
  has_many :transacts
  has_many :tokens
  belongs_to :user
  #has_many :inverse_reporting_structures, class_name: "ReportingStructure", foreign_key: "reportee_id"
  #has_many :managers, through: :inverse_reporting_structures, source: :user
  has_many :matches
  has_many :reportees, through: :matches, dependent: :destroy
  has_many :inverse_matches, class_name: "Match", foreign_key: "reportee_id"
  has_many :managers, through: :inverse_matches, source: :employee

  def create_token
    # require 'SecureRandom'
    require 'securerandom'
    self.tokens.create!(transaction_token: SecureRandom.uuid, transaction_token_created_at: Time.now, employee_id: self.id)
  end

  def create_transaction(token_id, flight_info)
    if !token_id.nil?
      token = Token.find(token_id)
    else
      token = self.create_token
    end
    transact = self.transacts.create!(token_id: token_id, company_id: self.company.id, third_party_vendor_id: flight_info.third_party_vendor_id, transaction_token: (token.nil? ? token.transaction_token : ""), transaction_token_created_at: token.transaction_token_created_at, employee_id: self.id)
    transact.transaction_details.create!({type: flight_info.type, transaction_id: transact.id, source: flight_info.source, destination: flight_info.destination, amount: flight_info.amount, confirmed: true})
  end

  def recreate_token(transact_id)
    require 'securerandom'
    # require 'SecureRandom'
    token = self.tokens.create!(transaction_token: SecureRandom.uuid, transaction_token_created_at: Time.now)
    transact = Transact.find(transact_id)
    transact.token_id = token.id
    transact.transaction_token = token.transaction_token
    transact.transaction_token_created_at = token.transaction_token_created_at
    transact.save!
    token
  end

  def approve_transaction(transact_id)
    transact = Transact.find(transact_id)
    transact.token.request_accepted
  end

  def reject_transaction(transact_id)
    transact = Transact.find(transact_id)
    transact.token.request_rejected
  end
end