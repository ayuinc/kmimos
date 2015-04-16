require "spec_helper"

describe BookingsController do 

    describe '#index' do
      describe "GET index" do
      it "assigns @bookings" do
        provider = create(:booking)
        get :index
        expect(assigns(:bookings)).to eq([booking])
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  end  

   describe '#new' do
    let(:booking) { create(:booking) }
    it "should send new message to the model" do
      Booking.should_receive(:new)
      post :new
    end
    it "@booking should be a new booking" do
      post :new
      expect(assigns(:booking)).to be_a_new(Provider)
    end
  end

end
