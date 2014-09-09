class ProfComment < ActiveRecord::Base
  belongs_to :ru_professor
  belongs_to :user
end
