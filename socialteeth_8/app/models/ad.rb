class Ad < ActiveRecord::Base
  attr_accessible :title, :user, :goal, :format
  
  belongs_to :user, :dependent => :destroy
  has_many :contributions
  
  validates_inclusion_of :format, :in=>[0,1,2], :allow_nil => false
  
  has_attached_file :image

end
