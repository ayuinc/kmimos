require 'spec_helper'

describe "provider_attachments/show" do
  before(:each) do
    @provider_attachment = assign(:provider_attachment, stub_model(ProviderAttachment,
      :provider_id => 1,
      :photo => "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Photo/)
  end
end
