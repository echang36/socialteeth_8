class Contribution < ActiveRecord::Base
  attr_accessible :ad_id, :user_id, :amount
  
  belongs_to :user
  belongs_to :ad
end
