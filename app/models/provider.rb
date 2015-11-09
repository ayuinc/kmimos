
class Provider < ActiveRecord::Base

  include ActiveModel::Serialization

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :category
  belongs_to :property
  belongs_to :behavior

  after_create :active_provider

  paginates_per 10

  mount_uploader :avatar, AvatarUploader

  has_many :rates
  accepts_nested_attributes_for :rates

  has_many :agings
  has_many :ages, :through => :agings
  accepts_nested_attributes_for :agings

  has_many :favorites


  has_many :sizings
  has_many :sizes, :through => :sizings
  accepts_nested_attributes_for :sizings

  has_many :own_sizings
  has_many :own_sizes, :through => :own_sizings, :source => :size
  accepts_nested_attributes_for :own_sizings

  has_many :localizations
  has_many :locations, through: :localizations
  accepts_nested_attributes_for :localizations

  has_many :comments

  has_many :additional_services
  has_many :services, :through => :additional_services
  accepts_nested_attributes_for :additional_services

  has_many :provider_attachments
  accepts_nested_attributes_for :provider_attachments

  has_many :pet_behaviors
  has_many :own_behaviors, :through => :pet_behaviors, :source => :behavior

  has_many :accepted_behaviors
  has_many :valid_behaviors, :through => :accepted_behaviors, :source => :behavior

  validates_presence_of :email, :name, :last_name_1, :phone, :dni
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :locations, :presence => true

  validate :dni_length, on: :create
  validate :dni_uniqueness, on: :create

  validates_format_of :dni, with: /[0-9]+\z/i, message: %Q[solo puede incluir números (0-9).]

  validates_format_of :phone, with: /\A[0-9\-]+\z/, message: %Q[solo puede incluir números (0-9) y guiones "-".]

  scope :providers_sliced, -> (n, providers) {providers.each_slice(n).to_a}
  scope :on_top_providers, -> (n) {where(on_top: true).limit(n)}
  

  def active_provider
    update_attributes(:active => true)
  end
  
  def favorite?(user)
    Favorite.where("user_id = ? AND provider_id = ?", user.id, self.id).count > 0
  end

  def get_behaviors
    #Behavior.find(self.behaviors_accepted)
    self.behaviors_accepted
  end
  
  def get_valoration
    valuations = Valuation.by_comments(self.id) 
    result = valuations.count > 0 ? (valuations.map{|v| v[1]}.reduce(:+).to_f / valuations.count.to_f) : 0
    return result.to_i
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
