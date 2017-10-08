class Token < ApplicationRecord
  belongs_to :employee
  has_one :transact
  
  has_one_time_password
  # attr_accessor :state
  before_save :validate_token

  # before_transition from: any, to: :use do |token, transition|
    
  # end

  def validate_token
    if self.transaction_token_created_at + 720.minutes > Time.now
      true
    else
      false
    end
  end

  def validate_otp(otp)
    self.authenticate_otp(otp, drift: 600)
  end

  def generate_otp
    self.otp_code
  end

  def after_use_event
    self.transact.pay_for_transaction
  end

  state_machine :state, initial: :initial do
    # before_transition
    #state :initial
    # state :submitted
    # state :approved
    # state :rejected
    # state :resubmitted
    # state :validated
    #state :used
    # state :expired 
    after_transition on: :use, do: :after_use_event
    event 'initiate' do
      transition :nil => :initial
    end

    event 'request_for_approval' do
      transition :initial => :submitted
    end

    event 'request_accepted' do
      transition :submitted => :approved
    end

    event 'request_rejected' do
      transition :submitted => :rejected
    end

    event 're_request_for_approval' do
      transition :rejected => :submitted
    end

    event 'invalidate' do 
      transition [:initial, :submitted, :rejected, :approved, :validated] => :expired
    end

    event 'valid' do
      transition :approved => :validated
    end

    event 'use' do
      transition :validated => :used
    end

    event 'cancel' do 
      transition [:initiated, :submitted, :rejected, :approved, :validated] => :canceled
    end

    
  end

end
