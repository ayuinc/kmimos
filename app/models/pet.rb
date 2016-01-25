class Pet < ActiveRecord::Base
  belongs_to :user_pet 
  
  belongs_to :own_size, :class_name => 'Size', :foreign_key => 'size_id'
  
  belongs_to :behavior
  belongs_to :race
  belongs_to :age

  has_many :booked_services

  

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>", original: {convert_options: '-auto-orient'} }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def to_s
    name
  end

end
