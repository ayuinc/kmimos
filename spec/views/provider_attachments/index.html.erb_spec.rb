require 'spec_helper'

describe "provider_attachments/index" do
  before(:each) do
    assign(:provider_attachments, [
      stub_model(ProviderAttachment,
        :provider_id => 1,
        :photo => "Photo"
      ),
      stub_model(ProviderAttachment,
        :provider_id => 1,
        :photo => "Photo"
      )
    ])
  end

  it "renders a list of provider_attachments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end
