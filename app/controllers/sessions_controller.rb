class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    user.save!

    if (geolocation = find_user_geolocation)
      params[:country] = geolocation.find { |location| location['types'].include?('country') }['long_name']
      params[:city] = geolocation.find { |location| location['types'].include?('locality') }['long_name']
    end

    os_params = OpenStruct.new(params)
    location = Location.with_user(user).from_current(os_params)
    location.updated_at = Time.current
    location.save!

    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:provider, :uid, :name, :oauth_token)
  end

  def find_user_geolocation
    return unless [:latitude, :longitude].all? { |k| params.key?(k) }
    geocoder = Geocoder.search("#{params[:latitude]},#{params[:longitude]}")
    geocoder.first.data['address_components']
  rescue
    nil
  end
end
