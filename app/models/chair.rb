class Chair < ActiveRecord::Base
  belongs_to :faculty
  attr_accessible :name, :redirect_uri
  attr_accessible :faculty_id, :redirect_uri
  validates :name, :presence => true,
                 :uniqueness => true,
                 :length => { :maximum => 50 }
end