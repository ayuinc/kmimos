require "spec_helper"

describe ProviderAttachmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/provider_attachments").should route_to("provider_attachments#index")
    end

    it "routes to #new" do
      get("/provider_attachments/new").should route_to("provider_attachments#new")
    end

    it "routes to #show" do
      get("/provider_attachments/1").should route_to("provider_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/provider_attachments/1/edit").should route_to("provider_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/provider_attachments").should route_to("provider_attachments#create")
    end

    it "routes to #update" do
      put("/provider_attachments/1").should route_to("provider_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/provider_attachments/1").should route_to("provider_attachments#destroy", :id => "1")
    end

  end
end
