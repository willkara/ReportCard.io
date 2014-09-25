class School < ActiveRecord::Base
  validates :name, :summary, :website, :address, presence: true
  has_many :departments
  has_many :ru_classes
  has_many :ru_professors

end
