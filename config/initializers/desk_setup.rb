Desk.configure do |config|
  config.support_email = ENV['SUPPORT_EMAIL']
  config.subdomain = ENV['DESK_SUBDOMAIN']
  config.consumer_key = ENV['DESK_CONSUMER_KEY']
  config.consumer_secret = ENV['DESK_CONSUMER_SECRET']
  config.oauth_token = ENV['DESK_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['DESK_OAUTH_TOKEN_SECRET']
end