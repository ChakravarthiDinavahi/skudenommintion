if Rails.env.production?
  ENV["FACEBOOK_APP_ID"]="1273084379495074"
  ENV["FACEBOOK_APP_SECRET"]="53d47316786d350a9a67b8c11fd4b3f7"
elsif Rails.env.development?
  ENV["FACEBOOK_APP_ID"]="1273084379495074"
  ENV["FACEBOOK_APP_SECRET"]="53d47316786d350a9a67b8c11fd4b3f7"
end
