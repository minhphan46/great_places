const API_KEY =
    'pk.eyJ1Ijoibm5oYW8yMDAzIiwiYSI6ImNsYW5wMWFuYjA4azYzdm52bHE2ZTJpcWIifQ.AeFt6dL_vbcZgROieATpfg';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    //return "https://api.mapbox.com/styles/v1/mapbox/light-v11/static/pin-s-l+000($longitude,$latitude)/$longitude,$latitude/600x300?access_token=$API_KEY";
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$API_KEY';
  }
}
