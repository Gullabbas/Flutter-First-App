import 'package:project1/models/weathers_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherServices {

  final String apikey = '161f305ea703a9dec69dca7b198fd292';

  Future<Weather> featchWeather(String cityName) async{
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey');


    final response = await http.get(url);
    // print("response: ${response.body}");r

    if(response.statusCode == 200){
      final res = Weather.fromjson(json.decode(response.body));

      print("response: ${res}");
      return res;
    }else{
      throw Exception('Failed to load weather data');
    }



  }
}