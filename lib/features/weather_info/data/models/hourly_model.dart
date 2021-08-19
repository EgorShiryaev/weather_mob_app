import 'package:weather_mobile_app/features/weather_info/data/models/weather_model.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/hourly_entity.dart';

class HourlyModel extends HourlyEntity {
  HourlyModel({
    required dt,
    required temp,
    required feelsLike,
    required pressure,
    required humidity,
    required dewPoint,
    required uvi,
    required clouds,
    required visibility,
    required windSpeed,
    required windDeg,
    required weather,
    required pop,
  }) : super(
          dt: dt,
          visibility: visibility,
          temp: temp,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          dewPoint: dewPoint,
          windSpeed: windSpeed,
          windDeg: windDeg,
          weather: weather,
          clouds: clouds,
          pop: pop,
          uvi: uvi,
        );

  factory HourlyModel.fromJson(Map<String, dynamic> json) {
    var weather = <WeatherModel>[];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(new WeatherModel.fromJson(v));
      });
    }
    return HourlyModel(
      dt: json['dt'],
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'].toDouble(),
      uvi: json['uvi'].toDouble(),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'].toDouble(),
      windDeg: json['wind_deg'],
      weather: weather,
      pop: json['pop'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['uvi'] = this.uvi;
    data['clouds'] = this.clouds;
    data['visibility'] = this.visibility;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    if (this.weather != null) {
      data['weather'] = this
          .weather
          .map((v) => WeatherModel(
                id: v.id,
                main: v.main,
                description: v.description,
                icon: v.icon,
              ).toJson())
          .toList();
    }
    data['pop'] = this.pop;
    return data;
  }
}
