class Job < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
end

def self.ransackable_associations(auth_object = nil)
    ["users"]
end
  #RELACIONES
  belongs_to :user
  has_many :postulations, dependent: :destroy
end
