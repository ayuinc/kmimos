class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   belongs_to :location
   
   has_many :user_pets
   has_many :pets, :through => :user_pets
   
   accepts_nested_attributes_for :pets
   
end
