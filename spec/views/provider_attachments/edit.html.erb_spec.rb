require 'spec_helper'

describe "provider_attachments/edit" do
  before(:each) do
    @provider_attachment = assign(:provider_attachment, stub_model(ProviderAttachment,
      :provider_id => 1,
      :photo => "MyString"
    ))
  end

  it "renders the edit provider_attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", provider_attachment_path(@provider_attachment), "post" do
      assert_select "input#provider_attachment_provider_id[name=?]", "provider_attachment[provider_id]"
      assert_select "input#provider_attachment_photo[name=?]", "provider_attachment[photo]"
    end
  end
end
