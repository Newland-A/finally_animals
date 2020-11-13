Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'],
  provider_ignores_state: true
  provider :facebook, ENV['FACEBOOK_CLIENT_ID'], ENV['FACEBOOK_CLIENT_SECRET'],
  provider_ignores_state: true
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'],
  provider_ignores_state: true
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
  provider_ignores_state: true
end