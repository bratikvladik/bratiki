class Faculty < ActiveRecord::Base
  has_many :users
  has_many :chairs
  attr_accessible :name, :redirect_uri
  validates :name, :presence => true,
            :uniqueness => true,
            :length => { :maximum => 50 }
end