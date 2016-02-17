ActiveAdmin.register User, as: 'Clientes' do
	permit_params :first_name, :last_name, :email, :phone, :address

	filter :first_name
	filter :last_name
	filter :email
	filter :phone
	filter :postal_code
	filter :address

	index do
		selectable_column
		id_column
		column :first_name
		column :last_name
		column :email
		column :phone
		column :postal_code
		column :address
	end

	form do |f|
		f.inputs "Customer Details" do
			f.input :first_name
			f.input :last_name
			f.input :email
			f.input :phone
			f.input :postal_code
			f.input :address
		end
		f.actions
	end

end
