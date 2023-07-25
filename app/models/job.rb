class Job < ApplicationRecord
  #RELACIONES
  belongs_to :user
  has_many :postulations
end
