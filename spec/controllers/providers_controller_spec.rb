require "spec_helper"

describe ProvidersController do 

    describe '#index' do
      describe "GET index" do
      it "assigns @providers" do
        provider = create(:provider)
        get :index
        expect(assigns(:providers)).to eq([provider])
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end  

   describe '#new' do
    let(:provider) { create(:provider) }
    it "should send new message to the model" do
      Provider.should_receive(:new)
      post :new
    end
    it "@provider should be a new provider" do
      post :new
      expect(assigns(:provider)).to be_a_new(Provider)
    end
  end

  describe "#show" do

    let(:location) { create(:location) }
    let(:provider) { create(:provider, locations: [location]) }
    let(:show_action) { get :show, id: provider.id }

    it "assign provider and renders the modal" do
      show_action
      expect(assigns(:provider)).to eq(provider)
    end

  end 
end
