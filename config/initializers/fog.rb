CarrierWave.configure do |config|

  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {

      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    #  :region                => ENV['S3_REGION']
    }
    config.fog_directory    = ENV['S3_BUCKET_NAME']
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"   # To let CarrierWave work on heroku
  #config.s3_access_policy = :public_read          # Generate http:// urls. Defaults to :authenticated_read (https://)
  #config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
end