class Location < ActiveRecord::Base
  belongs_to :user

  scope :with_user, -> (user) { where(user: user) if user.present? }
  scope :with_coordinates, -> (lat, lon){ where(latitude: lat, longitude: lon) }

  def self.from_current(position)
    with_coordinates(position.latitude, position.longitude).
      first_or_initialize do |location|
        location.city = position.city
        location.country = position.country
      end
  end
end
