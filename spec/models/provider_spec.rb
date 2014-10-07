  require "spec_helper"

describe Provider do

  describe 'attributes' do

    subject(:provider) { create(:provider) }

    context 'associations' do
      it { should belong_to(:category) }
      it { should have_many(:localizations) }
      it { should have_many(:locations).through(:localizations) }
    end

    context 'columns' do
      it { should have_db_column(:name) }
      it { should have_db_column(:last_name_1) }
      it { should have_db_column(:last_name_2) }
      it { should have_db_column(:category_id) }
      it { should have_db_column(:password_digest) }
      it { should have_db_column(:dni) }
      it { should have_db_column(:email) }
      it { should have_db_column(:phone) }
      it { should have_db_column(:picture_url) }
      it { should have_db_column(:avg_rating) }
      it { should have_db_column(:description) }
    end

    describe 'validations' do
      it { should have_secure_password }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:category_id) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:last_name_1) }
      it { should validate_presence_of(:last_name_2) }
      it { should validate_presence_of(:dni) }
      it { should validate_uniqueness_of(:dni) }
      it { should validate_presence_of(:phone) }
      it { should validate_uniqueness_of(:email) }
    end

    describe 'nested attributes' do
  #    it { should accept_nested_attributes_for(:pictures) }
  #    it { should accept_nested_attributes_for(:locations) }
    end
  end


  # describe "#search_subcategory_and_district" do

  #   let!(:provider_match) { create(:provider) }
  #   let!(:other_providers) { create_list(:provider, 6) }
  #   let!(:location) { create(:location, providers: [provider_match]) }

  #   it "should return search results" do
  #     results = Provider.search_subcategory_and_district(provider_match.subcategory_id, location.district_id)
  #     expect(results).to eq([provider_match])
  #   end
  # end 

end
