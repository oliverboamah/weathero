import 'dart:convert';

import 'package:http/http.dart';
import 'package:weathero/util/convert.dart';
import '../wrappers/weatherdata.dart';
import '../constants/constants.dart';

class Weather {
  Future<WeatherData> getWeather({String city}) async {
    try {
      final response = await get(Constants.GET_WEATHER_URL + city);
      var weather = json.decode(response.body);

      if (weather['name'] != null) {
        return WeatherData(
            city: weather['name'],
            title: weather['weather'][0]['main'],
            description: weather['weather'][0]['description'],
            degrees:
                Convert.fromKelvinToDegrees(weather['main']['temp'].round()));
      }

      return null;
      
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
