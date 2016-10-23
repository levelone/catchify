$(document).ready ->
  options =
    enableHighAccuracy: true
    timeout: 5000
    maximumAge: 0

  success = (pos) ->
    @latitude = pos.coords.latitude
    @longitude = pos.coords.longitude
    console.log 'Your current position is:'
    console.log 'Latitude : ' + @latitude
    console.log 'Longitude: ' + @longitude
    return

  error = (err) ->
    console.warn 'ERROR(' + err.code + '): ' + err.message
    return

  navigator.geolocation.getCurrentPosition success, error, options
