ActiveAdmin.register Size do
  menu parent: 'Mantenimiento'
  
  permit_params :size_title, :min_size, :max_size, :description
  
end