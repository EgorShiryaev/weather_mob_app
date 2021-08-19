import 'package:flutter/material.dart';
import 'package:weather_mobile_app/core/constants/constants.dart';
import 'package:weather_mobile_app/core/size/size.dart';
import 'package:weather_mobile_app/core/util/util.dart';
import 'package:weather_mobile_app/features/weather_info/domain/entities/daily_entity.dart';

class DailyWeatherWidget extends StatelessWidget {
  final List<DailyEntity> dailyWeather;
  DailyWeatherWidget({required this.dailyWeather});

  var dayOfWeek = {
    'Tuesday': 'Вторник',
    'Wednesday': 'Среда',
    'Thursday': 'Четверг',
    'Friday': 'Пятница',
    'Saturday': 'Суббота',
    'Sunday': 'Воскресенье',
    'Monday': 'Понедельник',
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(dailyWeather.length, (index) {
        return Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 1),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Stack(
                      children: [
    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              index == 0
                                  ? 'Сегодня'
                                  : index == 1
                                      ? 'Завтра'
                                      : _makeGreatWeekDay(
                                          dailyWeather[index].dt),
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              width: SIZE.getSize(context).width * 0.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${dailyWeather[index].feelsLike.day.round()}°',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  
                                  Text(
                                    '${dailyWeather[index].feelsLike.night.round()}°',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  index == dailyWeather.length -1 ? Divider(height: 1) : Container(), 
                ],
              ),
            ),
            Align(
              alignment: Alignment(0.3, 0),
              child: Image.network(
                  Constants.openWeatherMapIcon +
                      dailyWeather[index].weather[0].icon,
                  scale: 1),
            )
          ],
        );
      }),
    );
  }

  _makeGreatWeekDay(int dt) {
    return dayOfWeek[Util.getFormattedWeekDay(
        DateTime.fromMillisecondsSinceEpoch(dt * 1000))];
  }
}
