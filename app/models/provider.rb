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

  belongs_to :category
  belongs_to :property

  has_secure_password

  has_many :agings
  has_many :ages, :through => :agings

  has_many :sizings
  has_many :sizes, :through => :sizings

  has_many :localizations
  has_many :locations, through: :localizations

  mount_uploader :avatar, AvatarUploader

  has_many :provider_attachments

  accepts_nested_attributes_for :provider_attachments

  validates_presence_of :email, :category_id, :name, :last_name_1, :last_name_2, :phone, :dni
  validates :email, :email => true

  validates :locations, :presence => true

  validates_format_of :dni,
    with: /[0-9]+\z/i,
    message: %Q[solo puede incluir números (0-9).]

  validates_format_of :phone,
    with: /\A[0-9\-]+\z/,
    message: %Q[solo puede incluir números (0-9) y guiones "-".]

  validate :fields_a_and_b_are_equal, on: :create
  validate :dni_length, on: :create
  validate :dni_uniqueness, on: :create

  def prov_locations_modal
    if self.locations.count > 3
      return "#{self.locations[0].name}, #{self.locations[1].name}, #{self.locations[2].name}"
    else
      return self.locations.map(&:name).join(", ")
    end
  end

  protected

  def fields_a_and_b_are_equal
    if self.email.present?
      unless self.email == self.email_c
        errors.add(:email_c, 'debe coincidir con el correo electrónico')
      end
    end
  end

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
