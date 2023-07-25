class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #RELACIONES
  has_many :jobs
  has_many :postulations
  #ROLES
  enum :roles , [:employee, :admin]
end
