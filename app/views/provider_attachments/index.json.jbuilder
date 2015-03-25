json.array!(@provider_attachments) do |provider_attachment|
  json.extract! provider_attachment, :id, :provider_id, :photo
  json.url provider_attachment_url(provider_attachment, format: :json)
end
