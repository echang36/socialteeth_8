class Owner < ActiveRecord::Base
	has_one :user
end
