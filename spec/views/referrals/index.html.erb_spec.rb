require 'spec_helper'

describe "referrals/index" do
  before(:each) do
    assign(:referrals, [
      stub_model(Referral,
        :code => "Code",
        :referrer_name => "Referrer Name",
        :referrer_email => "Referrer Email"
      ),
      stub_model(Referral,
        :code => "Code",
        :referrer_name => "Referrer Name",
        :referrer_email => "Referrer Email"
      )
    ])
  end

  it "renders a list of referrals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Referrer Name".to_s, :count => 2
    assert_select "tr>td", :text => "Referrer Email".to_s, :count => 2
  end
end
