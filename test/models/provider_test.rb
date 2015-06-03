require "test_helper"

class ProviderTest < ActiveSupport::TestCase

  def setup
    @provider = providers(:one)
  end

  # associations
  should belong_to(:category)
  should belong_to(:property)
  should have_many(:localizations)
  should have_many(:locations).through(:localizations)
  should have_many(:provider_attachments)
  should have_many(:ages).through(:agings)
  should have_many(:agings)
  should have_many(:sizes).through(:sizings)
  should have_many(:sizings)
  # nested attributes
  should accept_nested_attributes_for(:provider_attachments)
  # columns
  should have_db_column(:name)
  should have_db_column(:last_name_1)
  should have_db_column(:last_name_2)
  should have_db_column(:category_id)
  should have_db_column(:password_digest)
  should have_db_column(:dni)
  should have_db_column(:email)
  should have_db_column(:phone)
  should have_db_column(:avg_rating)
  should have_db_column(:description)
  # validations
  should validate_presence_of(:email)
  should validate_presence_of(:category_id)
  should validate_presence_of(:name)
  should validate_presence_of(:last_name_1)
  should validate_presence_of(:last_name_2)
  should validate_presence_of(:dni)
  should validate_uniqueness_of(:dni)
  should validate_presence_of(:phone)
  should validate_uniqueness_of(:dni)


  test "is valid with valid params" do
   assert_equal true, @provider.valid? # Must create with valid params
  end

  test "is invalid without an email" do
    provider = Provider.new(name: "John Doe")
    provider.save
    assert_equal provider.valid?, false
    assert_equal provider.errors[:email].present?, true
  end

  test "email_c must be present" do
    provider = Provider.new(email: "correo@mail.com")
    provider.save
    assert_equal provider.valid?, false
    assert_equal "debe coincidir con el correo electrónico", provider.errors[:email_c][0]
  end

  test "is invalid without both last names" do
    provider = Provider.new(name: "John Doe")
    provider.save
    assert_equal provider.valid?, false # Must not be valid without email
    assert_equal provider.errors[:last_name_1].present?, true # Must have error for missing last_name_1
    assert_equal provider.errors[:last_name_2].present?, true # Must have error for missing last_name_2
  end

end