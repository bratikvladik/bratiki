#coding: utf-8
class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  belongs_to :sex
  belongs_to :chair
  belongs_to :military_rank
  belongs_to :scientific_rank
  belongs_to :scientific_degree
  belongs_to :post
  attr_accessible :activated,
                  :banned,
                  :email,
                  :first_name,
                  :last_name,
                  :middle_name,
                  :password,
                  :password_confirmation,
                  :phone,
                  :room,
                  :sex_id,
                  :chair_id,
                  :military_rank_id,
                  :scientific_rank_id,
                  :scientific_degree_id,
                  :post_id

  validates_presence_of :email, :message => "введите фамилию"
  validates_uniqueness_of :email, :message => "введите другой email, данный email уже зарегистрирован"
  validates_format_of :email, :with =>  /^([a-z0-9_\-]+\.)*[a-z0-9_\-]+\@([a-z0-9][a-z0-9\-]*[a-z0-9]\.)+[a-z]{2,4}$/i

  validates_presence_of :password, :message => "введите пароль"
  validates_length_of :password, :maximum => 30, :message => "слишком длинный пароль"
  validates_length_of :password, :minimum => 5, :message => "слишком короткий пароль"
  validates_confirmation_of :password, :message => "пароли не совпадают"
  validates_format_of :password, :with =>  /^([a-z0-9\?\'\+\-\_\<\>\"\;\`\:\!\@\#\$\%\^\&\*\(\)\{\}\[\]\,\.\/\\\|])+$/i,
                      :message => "некорректный email"

  validates_presence_of :last_name, :message => "введите фамилию"
  validates_format_of :last_name, :with =>  /^([а-я])+$/i, :message => "фамилия введена некорректно"

  validates_presence_of :first_name, :message => "введите имя"
  validates_format_of :first_name, :with =>  /^([а-я])+$/i, :message => "имя введено некорректно"

  validates_presence_of :middle_name, :message => "введите отчество"
  validates_format_of :middle_name, :with =>  /^([а-я])+$/i, :message => "отчество введено некорректно"

  validates_format_of :phone, :with => /^([0-9]{11})?$/, :message => "номер телефона введен некорректно"

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