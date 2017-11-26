class Operation < ApplicationRecord
  belongs_to :account

  def approve_operation
    self.commited = true
    self.save!
  end

  def self.all_transaction
    Operation.all
  end

  def self.all_debit_transaction
    Operation.where(tr_type: "dr")
  end

  def self.all_credit_transaction
    Operation.where(tr_type: "cr")
  end

  def self.all_commited_transaction
    Operation.where(commited: true)
  end

  def self.all_uncommited_transaction
    Operation.where(commited: false)
  end

  def self.get_all_transaction_of_company(company_id)
    @company = Company.find(company_id)
    @account = @company.account
    @operations = @account.operations
  end

  def self.get_all_debit_transaction_of_company(company_id)
    @company = Company.find(company_id)
    @account = @company.account
    @operations = @account.operations.where(tr_type: "dr")
  end

  def self.get_all_credit_transaction_of_company(company_id)
    @company = Company.find(company_id)
    @account = @company.account
    @operations = @account.operations.where(tr_type: "cr")
  end

  def self.get_all_approved_transaction_of_company(company_id)
    @company = Company.find(company_id)
    @account = @company.account
    @operations = @account.operations.where(commited: true)
  end

  def self.get_all_unapproved_transaction_of_company(company_id)
    @company = Company.find(company_id)
    @account = @company.account
    @operations = @account.operations.where(commited: true)
  end
  
end
