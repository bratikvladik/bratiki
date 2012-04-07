#coding: UTF-8
class ScientificRank < ActiveRecord::Base
  has_many :users
  attr_accessible :name, :redirect_uri
  validates_format_of :name, :with => /^[а-я ]+$/i, :message => "некорректное название"
  validates_presence_of :name, :message => "введите название"
  validates_uniqueness_of :name, :message => "введите другое название"
  validates_length_of :name, :maximum => 50, :message => "слишком длинное название"
end