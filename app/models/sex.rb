class Sex < ActiveRecord::Base
  has_many :users
  attr_accessible :name, :redirect_uri
  validates :name, :presence => true,
            :uniqueness => true,
                 :length => { :maximum => 50 }
end