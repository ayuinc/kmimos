ActiveAdmin.register Service do
  menu parent: 'Mantenimiento'
  
  permit_params :service_name
end