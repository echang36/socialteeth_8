class Ability
  include CanCan::Ability

  def initialize(user)

	if user ||= User.new #guest user
		can :read, Ad
	end

	can :create, Ad
	can [:update, :destroy], Ad do |ad|
		ad.try(:user) == user
	end
	
	can :create, Contribution
	can [:read, :update, :destroy], Contribution do |c|
		c.try(:user)== user
	end
	
  end
 end