class Token < ApplicationRecord
  belongs_to :employee
  has_one :transact

  # attr_accessor :state
  before_save :validate_token

  def validate_token
    if self.transaction_token_created_at + 30.minutes > Time.now
      true
    else
      false
    end
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

    event 'cancle' do 
      transition [:initiated, :submitted, :rejected, :approved, :validated] => :cancled
    end

    
  end

end
