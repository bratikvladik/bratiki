#coding: UTF-8
class ScientificDegree < ActiveRecord::Base
  attr_accessible :name
  has_many :users

  validates_format_of :name, :with => /^[а-я ]+$/i, :message => "некорректное название"
  validates_presence_of :name, :message => "введите название"
  validates_uniqueness_of :name, :message => "введите другое название"
  validates_length_of :name, :maximum => 50, :message => "слишком длинное название"
end
