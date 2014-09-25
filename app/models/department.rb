class Department < ActiveRecord::Base
  include FriendlyId
  friendly_id :name

  validates :name, :description, presence: true


  has_many :ru_classes
  has_many :ru_professors
end
