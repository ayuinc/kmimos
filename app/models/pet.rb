class Pet < ActiveRecord::Base
  belongs_to :user_pet
  belongs_to :size
  belongs_to :behavior
  belongs_to :race
  
  belongs_to :weight
  
  has_many :booked_services
   
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  
    def to_s
      name
    end
  
end

