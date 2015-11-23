ActiveAdmin.register State do
  permit_params :country_id, :name, locations_attributes: [:name, :state_id, :utf_name]
  
  form do |f|
    f.inputs "Estado" do
      f.input :country
      f.input :name 
      f.inputs "Municipios" do
        f.has_many :locations do |l|
          l.input :id, as: :hidden
          l.input :name
          l.input :utf_name
          l.input :_destroy, :as => :boolean
        end
      end
      
    end
    f.actions
  end
  
end