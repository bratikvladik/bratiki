class Schedule < ActiveRecord::Base
  attr_accessible :date, :group, :number, :object, :place, :type, :last_name_with_initials
end
