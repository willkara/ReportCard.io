class School < ActiveRecord::Base
  include FriendlyId
  friendly_id :name
  validates :name, :summary, :website, :address, presence: true
  has_many :departments
  has_many :ru_classes
  has_many :ru_professors

end
