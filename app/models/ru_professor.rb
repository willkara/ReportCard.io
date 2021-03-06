class RuProfessor < ActiveRecord::Base
  include FriendlyId
  friendly_id :last_name
  validates :first_name, :last_name, :email, presence: true

  has_many :prof_comments
  has_many :prof_class_maps
  has_many :ru_classes, :through => :prof_class_maps

  belongs_to :department
end
