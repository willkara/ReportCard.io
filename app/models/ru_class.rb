class RuClass < ActiveRecord::Base
  validates :class_title, :class_synopsis, presence: true, uniqueness: true
  has_many :class_comments
  has_many :prof_class_maps
  has_many :ru_professors, :through => :prof_class_maps

  belongs_to :department
end
