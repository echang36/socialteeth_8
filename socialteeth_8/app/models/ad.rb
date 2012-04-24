class Ad < ActiveRecord::Base
  attr_accessible :title, :user, :goal
  
  belongs_to :user
  has_many :contributions
end
