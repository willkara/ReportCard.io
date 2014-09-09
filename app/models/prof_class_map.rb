class ProfClassMap < ActiveRecord::Base
  belongs_to :ru_professor
  belongs_to :ru_class
end
