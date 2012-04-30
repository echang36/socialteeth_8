class Ad < ActiveRecord::Base
  attr_accessible :title, :user, :goal, :format
  
  
  #RELATIONS
  belongs_to :user, :dependent => :destroy
  has_many :contributions
  has_attached_file :image
  
  #VALIDATIONS
  
  validates :title, :user, :goal, :format, presence: true
  validates :title, uniqueness: true
  validates_inclusion_of :format, :in=>[0,1,2], :allow_nil => false
  validates :goal, numericality: {greater_than_or_equal_to: 0.01}


end
