OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '210596532695816', 'e7d3f9c53409df106bb9dd33f32ea18a'
end

