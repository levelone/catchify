$(document).ready ->
  options =
    enableHighAccuracy: true
    timeout: 5000
    maximumAge: 0

  success = (pos) ->
    window.latitude = pos.coords.latitude
    window.longitude = pos.coords.longitude
    console.log 'Your current position is:'
    console.log 'Latitude : ' + window.latitude
    console.log 'Longitude: ' + window.longitude
    return

  error = (err) ->
    console.warn 'ERROR(' + err.code + '): ' + err.message
    return

  navigator.geolocation.getCurrentPosition success, error, options
