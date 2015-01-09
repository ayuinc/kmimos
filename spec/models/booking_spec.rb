require 'spec_helper'

describe Booking do
	describe 'attributes' do

	  subject(:booking) { create(:booking) }

	  # context 'associations' do
	  #   it { should belong_to(:category) }
	  #   it { should have_many(:localizations) }
	  #   it { should have_many(:locations).through(:localizations) }
	  #   it { should have_many(:pictures) }
	  # end

	  # context 'nested attributes' do
	  #   it { should accept_nested_attributes_for(:pictures) }
	  # end

	  context 'columns' do
	    it { should have_db_column(:user_first_name) }
	    it { should have_db_column(:user_last_name) }
	    it { should have_db_column(:user_email) }
	    it { should have_db_column(:user_phone) }
	    it { should have_db_column(:ref_code) }
	    it { should have_db_column(:user_message) }
	    it { should have_db_column(:provider_id) }
	  end

	  describe 'validations' do
	    it { should validate_presence_of(:email) }
	    it { should validate_presence_of(:provider_id) }
	    it { should validate_presence_of(:user_first_name) }
	    it { should validate_presence_of(:user_last_name) }
	    it { should validate_presence_of(:start_date) }
	    it { should validate_presence_of(:end_date) }
	  end

	end

end
