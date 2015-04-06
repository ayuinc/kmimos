require 'spec_helper'

describe "provider_attachments/new" do
  before(:each) do
    assign(:provider_attachment, stub_model(ProviderAttachment,
      :provider_id => 1,
      :photo => "MyString"
    ).as_new_record)
  end

  it "renders new provider_attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", provider_attachments_path, "post" do
      assert_select "input#provider_attachment_provider_id[name=?]", "provider_attachment[provider_id]"
      assert_select "input#provider_attachment_photo[name=?]", "provider_attachment[photo]"
    end
  end
end
