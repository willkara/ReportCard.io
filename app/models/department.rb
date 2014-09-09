class Department < ActiveRecord::Base
  has_many :ru_classes
  has_many :ru_professors
end
