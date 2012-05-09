class Contribution < ActiveRecord::Base

  include AASM

  attr_accessible :ad_id, :user_id, :amount, :status
  
  belongs_to :user, :dependent => :destroy
  belongs_to :ad, :dependent => :destroy
  has_many :transactions, 
			:class_name => "ContributionTransaction",
			:dependent => :destroy
  
  #Uses Act_as_State_Machine gem to map out state transitions 
  aasm :column => :status do 
  
	  state :pending, :initial=>true
	  state :authorized
	  state :paid
	  state :payment_declined
	  
	  
	  event :payment_authorized do
		transitions :from => :pending,
					:to   => :authorized
		transitions :from => :payment_declined,
					:to   => :authorized			
	  end
	 
	  event :transacion_declined do
		transitions :from => :pending,
					:to   => :payment_declined
		
		transitions :from => :payment_declined,
					:to   => :payment_declined
					
		transitions :from => :authorized,
					:to   => :authorized
		end
	end
	

  #NEED A DIFFERENT NUMBERING SCHEME FOR PRODUCTION
  def number
	"#{Time.now.to_i}-#{rand(1_000_000)}"
  end
	
  def authorize_payment(credit_card, options={})
	options[:order_id] = number
	transaction do
		authorization = ContributionTransaction.authorize(amount, credit_card, options)
		transactions.push(authorization)
		if authorization.success?
			payment_authorized!
		else
			transaction_declined!
		end
		authorization
	end
  end
	
	
  def authorization_reference
    if authorization = transactions.find_by_action_and_success('authorization', true, :order => 'id ASC')
      authorization.reference
    end
  end
end
