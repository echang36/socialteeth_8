ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

include ActiveMerchant::Billing

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  def credit_card_hash(options={})
  { :number => '1',
	:first_name => 'Cody',
	:last_name => 'Fauser',
	:month => '8',
	:year => "#{Time.now.year +1}",
	:verification_value=>'123',
	:type => 'visa'
  }.update(options)
  end
  
  def credit_card(options={})
	ActiveMerchant::Billing::CreditCard.new(credit_card_hash(options))
  end
  
  def address (options={})
  { :name -> 'Cody Fauser',
	:address1 => '2500 Oak Mills Road',
	:address2 => 'Suite 200',
	:city => 'Beverly Hills',
	:state => 'CA',
	:country => 'US',
	:zip => '90210'
  }.update(options)
  end
  
end
