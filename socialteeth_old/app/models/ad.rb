class Ad < ActiveRecord::Base
	belongs_to :owner, :inverse_of=> :ads
end
