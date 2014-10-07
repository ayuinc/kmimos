json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :last_name_1, :last_name_2, :dni, :email, :category_id
  json.url provider_url(provider, format: :json)
end
