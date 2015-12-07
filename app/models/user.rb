class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :car, dependent: :destroy
  has_many :journeys
  has_many :passengers
  has_many :drivers
  # has_many :feedbacks, :through => :passenger
end