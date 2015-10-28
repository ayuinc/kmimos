class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   belongs_to :location
   
   has_many :user_pets
   has_many :pets, :through => :user_pets
   has_many :bookings
   has_many :comments
   
   accepts_nested_attributes_for :pets
   
   has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "user.jpg", 
   :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
     validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
     
     
 
   def s3_credentials
       {:bucket => ENV["S3_BUCKET_NAME"], :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]}
   end
     
   
end
