#coding: utf-8
class User < ActiveRecord::Base
  attr_accessor :password_confirmation

  attr_accessible :email, :redirect_uri
  attr_accessible :password, :redirect_uri
  attr_accessible :password_confirmation, :redirect_uri
  attr_accessible :activated, :redirect_uri
  attr_accessible :banned, :redirect_uri
  attr_accessible :last_name, :redirect_uri
  attr_accessible :first_name, :redirect_uri
  attr_accessible :middle_name, :redirect_uri
  attr_accessible :sex_id, :redirect_uri
  attr_accessible :chair_id, :redirect_uri
  attr_accessible :military_rank_id, :redirect_uri
  attr_accessible :scientific_rank_id, :redirect_uri
  attr_accessible :scientific_degree_id, :redirect_uri
  attr_accessible :post_id, :redirect_uri
  attr_accessible :phone, :redirect_uri
  attr_accessible :room, :redirect_uri


  belongs_to :chair
  belongs_to :sex
  belongs_to :military_rank
  belongs_to :scientific_rank
  belongs_to :scientific_degree
  belongs_to :post
  has_many :logs

  validates :email, :presence => true,
            :uniqueness => true,
            :length => { :maximum => 30 },
            :format => { :with =>  /^([a-z0-9_\-]+\.)*[a-z0-9_\-]+\@([a-z0-9][a-z0-9\-]*[a-z0-9]\.)+[a-z]{2,4}$/i }

  validates :password, :presence => true,
            :length => { :maximum => 30, :minimum => 5 },
            :confirmation => true,
            :format => { :with =>  /^([a-z0-9\?\'\+\-\_\<\>\"\;\`\:\!\@\#\$\%\^\&\*\(\)\{\}\[\]\,\.\/\\\|])+$/i }

  validates :last_name, :presence => true,
            :length => { :maximum => 30 },
            :format => { :with =>  /^([а-я])+$/i }

  validates :first_name, :presence => true,
            :length => { :maximum => 30 },
            :format => { :with =>  /^([а-я])+$/i }

  validates :middle_name, :presence => true,
            :length => { :maximum => 30 },
            :format => { :with =>  /^([а-я])+$/i }

  validates :phone, :format => { :with => /^([0-9]{11})?$/ }

  def full_name
    self.last_name + " " + self.first_name + " " + self.middle_name 
  end

  def last_name_with_initials
    self.last_name + " " + self.first_name.upcase[0] + " " + self.middle_name.upcase[0]
  end

  private
  def self.authenticate(email, password)
    user = self.where(:email => email, :password => password).first
  end
  
  

end
