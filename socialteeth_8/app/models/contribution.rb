class Contribution < ActiveRecord::Base
  attr_accessible :ad_id, :user_id, :amount
  
  belongs_to :user, :dependent => :destroy
  belongs_to :ad, :dependent => :destroy
end
