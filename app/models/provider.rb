# == Schema Information
#
# Table name: providers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  last_name_1     :string(255)
#  last_name_2     :string(255)
#  dni             :string(255)
#  email           :string(255)
#  category_id     :integer
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  avg_rating      :float
#  phone           :string(255)
#  description     :text
#  email_c         :string(255)
#  avatar          :string(255)
#  price           :float
#  areas_externas  :string(255)
#  emergencia      :boolean
#  experiencia     :integer
#  iframe_code     :text
#  property_id     :integer
#  active          :boolean          default(TRUE)
#  latitude        :string(255)
#  longitude       :string(255)
#  address         :string(255)
#

class Provider < ActiveRecord::Base
  
 include ActiveModel::Serialization
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :category
  
  belongs_to :property
  belongs_to :pet_behavior
  
  paginates_per 10
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :rates 
  accepts_nested_attributes_for :rates
  
  has_many :agings
  has_many :ages, :through => :agings
  
  has_many :sizings
  has_many :sizes, :through => :sizings
  
  has_many :own_sizings
  has_many :own_sizes, :through => :own_sizings, :source => :size 
  
  has_many :localizations
  has_many :locations, through: :localizations, :source => :location
   
  has_many :provider_attachments
  
  has_many :comments
  
  has_many :additional_services
  has_many :services, :through => :additional_services
  
  accepts_nested_attributes_for :additional_services
  
  accepts_nested_attributes_for :provider_attachments
  
  # Temporary not necesary :category_id
  validates_presence_of :email, :name, :last_name_1, :phone, :dni
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :locations, :presence => true
  
  validates_format_of :dni,
    with: /[0-9]+\z/i,
    message: %Q[solo puede incluir números (0-9).]
  
  validates_format_of :phone,
    with: /\A[0-9\-]+\z/,
    message: %Q[solo puede incluir números (0-9) y guiones "-".]  
   
  validate :dni_length, on: :create
  validate :dni_uniqueness, on: :create


  scope :providers_sliced, -> (n, providers) {providers.each_slice(n).to_a}
  scope :on_top_providers, -> (n) {where(on_top: true).limit(n)}
  
  def valuations 
     
  end


  def to_s
    "#{name} #{last_name_1} #{last_name_2}"
  end

  def prov_locations_modal
    if self.locations.count > 3
      return "#{self.locations[0].name}, #{self.locations[1].name}, #{self.locations[2].name}"
    else
      return self.locations.map(&:name).join(", ") rescue ''
    end
  end

  protected

 
  def dni_length
    if self.locations[0] != nil
      unless self.dni.length == self.locations[0].state.country.dni_length
        errors.add(:dni, "debe tener #{self.locations[0].state.country.dni_length} dígitos.")
      end
    end
  end
  
  def dni_uniqueness
    if self.locations[0] != nil
      provider = Provider.find_by_dni(self.dni)
      if provider != nil
        errors.add(:dni, "ya está en uso")
      end
    end
  end
end
