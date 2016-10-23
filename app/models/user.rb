class User < ActiveRecord::Base
  has_one :location, -> { order('id DESC').limit(1) }

  def self.from_omniauth(auth)
    User.find_or_initialize_by(uid: auth.uid).tap do |u|
      u.provider = auth.provider
      u.name = auth.info.name
      u.email = auth.info.email
      u.image = auth.info.image
      u.oauth_token = auth.credentials.token
      u.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end
end
