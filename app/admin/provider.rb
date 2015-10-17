ActiveAdmin.register Provider do
  permit_params :name, :last_name_1, :last_name_2, :dni, :email, :phone, :description, :email_c, :avatar,
  :price, :areas_externas, :emergencia, :experiencia, :active, :latitude, :longitude, :address
   
   
  index do
    selectable_column
    id_column
    column :name
    column :last_name_1
    column :last_name_2
    column :dni
    column :email
    column :phone
    actions
  end
 
  
  
  

  form do |f|
    f.inputs "Provider Details" do
      f.input :name
      f.input :last_name_1
      f.input :last_name_2
      f.input :active
    end
    f.actions
  end
  
end

#  id              :integer          not null, primary key
#  name            :string(255)
#  last_name_1     :string(255)
#  last_name_2     :string(255)
#  dni             :string(255)
#  email           :string(255)
#  category_id     :integer
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  avg_rating      :float
#  phone           :string(255)
#  description     :text
#  email_c         :string(255)
#  avatar          :string(255)
#  price           :float
#  areas_externas  :string(255)
#  emergencia      :boolean
#  experiencia     :integer
#  iframe_code     :text
#  property_id     :integer
#  active          :boolean          default(TRUE)
#  latitude        :string(255)
#  longitude       :string(255)
#  address         :string(255)