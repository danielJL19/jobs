class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #RELACIONES
  has_many :jobs, dependent: :destroy
  has_many :postulations, dependent: :destroy
  #ROLES
  enum :roles , [:employee, :admin]
end
