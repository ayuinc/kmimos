ActiveAdmin.register Benefit do
    permit_params :title, :description, :icon

    form do |f|
        f.inputs "Beneficio" do
            f.input :title
            f.input :description
            f.input :icon, as: :file
        end
        f.actions
    end
end
