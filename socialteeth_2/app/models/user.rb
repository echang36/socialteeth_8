class User < ActiveRecord::Base
	validates :name, :email, presence: true
	validates :email, uniqueness: true
	validates :email, format: {
		with: %r{^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$}i,
		message: 'Not a valid email address'
	}
	
	has_many :ads
	has_many :contributions
end
