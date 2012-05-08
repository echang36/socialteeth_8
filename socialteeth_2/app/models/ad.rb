class Ad < ActiveRecord::Base
	
	validates :title, :link, :goal, presence: true
	validates :goal, numericality: {greater_than_or_equal_to: 1}
  
	belongs_to :user
	has_many :contributions
end
