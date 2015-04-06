json.array!(@referrals) do |referral|
  json.extract! referral, :id, :code, :referrer_name, :referrer_email
  json.url referral_url(referral, format: :json)
end
