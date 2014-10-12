class School < ActiveRecord::Base
  include FriendlyId
  friendly_id :name
  validates :name, :summary, :website, :address, presence: true

  has_many :departments

end
