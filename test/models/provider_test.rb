require "test_helper"

class ProviderTest < ActiveSupport::TestCase

  # let(:provider_params) { { name: "John Doe", email: "john@example.com" } }
  # let(:provider) { Provider.new provider_params }
  def setup
    @provider = providers(:one)
  end
  
  # test "should belong to category" do
  #   should belong_to(:category)
  # end
  
  test "is valid with valid params" do
   # byebug
   assert_equal true, @provider.valid? # Must create with valid params
  end

  test "is invalid without an email" do
    # Delete email before provider let is called
    provider = Provider.new(name: "John Doe")
    provider.save
    assert_equal provider.valid?, false # Must not be valid without email
    assert_equal provider.errors[:email].present?, true # Must have error for missing email
  end

end