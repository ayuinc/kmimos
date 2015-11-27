class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

   belongs_to :location
    

   has_many :user_pets
   has_many :pets, :through => :user_pets
   has_many :bookings
   has_many :comments
   has_many :favorites
   has_many :meetings

   accepts_nested_attributes_for :pets, :allow_destroy => true, update_only: true

   has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "user.jpg"
     validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/


     def to_s
       "#{first_name} #{last_name}"
     end



end
