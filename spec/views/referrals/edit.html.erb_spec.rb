require 'spec_helper'

describe "referrals/edit" do
  before(:each) do
    @referral = assign(:referral, stub_model(Referral,
      :code => "MyString",
      :referrer_name => "MyString",
      :referrer_email => "MyString"
    ))
  end

  it "renders the edit referral form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", referral_path(@referral), "post" do
      assert_select "input#referral_code[name=?]", "referral[code]"
      assert_select "input#referral_referrer_name[name=?]", "referral[referrer_name]"
      assert_select "input#referral_referrer_email[name=?]", "referral[referrer_email]"
    end
  end
end
