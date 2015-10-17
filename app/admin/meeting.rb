ActiveAdmin.register Meeting do
  #  id              :integer          not null, primary key
  #  provider_id     :integer
  #  user_first_name :string(255)
  #  user_last_name  :string(255)
  #  user_phone      :string(255)
  #  user_email      :string(255)
  
  permit :provider, :user_first_name, :user_last_name, :user_phone, :user_email
end
