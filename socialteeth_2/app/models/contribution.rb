class Contribution < ActiveRecord::Base

  validates :amount, numericality: {greater_than_or_equal_to: 0.01}

  belongs_to :user
  belongs_to :ad
end
