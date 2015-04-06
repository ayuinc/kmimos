require 'spec_helper'

describe "referrals/show" do
  before(:each) do
    @referral = assign(:referral, stub_model(Referral,
      :code => "Code",
      :referrer_name => "Referrer Name",
      :referrer_email => "Referrer Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Referrer Name/)
    rendered.should match(/Referrer Email/)
  end
end
