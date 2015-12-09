class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_messageable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :car, dependent: :destroy
  has_many :journeys
  has_many :passengers
  has_many :drivers
  # has_many :feedbacks, :through => :passenger
  has_many :given_feedback, class_name: 'Feedback'

  before_create :set_default_role

  def feedback

    DriverFeedback.joins(:target).where(drivers: { user_id: id } ) +
    PassengerFeedback.joins(:target).where(passengers: { user_id: id } )



  end

  def set_default_role
    self.role = "user" unless role
  end 

  
  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  def mailboxer_name
    self.name
  end

 def mailboxer_email(object)

     if object.class==Mailboxer::Notification
       return nil
     else
       email
     end
  end
end
