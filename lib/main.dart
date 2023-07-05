import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  var isNight = false;

  void _changeDayTime() {
    print('isNight before pressed: $isNight');

    setState(() {
      isNight = !isNight;
    });
    print('isNight after pressed: $isNight');
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilds');
    const gapH20 = SizedBox(height: 20);
    return Scaffold(
      // body: Stack(
      //   children: [
      //     Container(
      //       decoration: const BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors: [Colors.blue, Colors.cyan, Colors.lightBlue]),
      //       ),
      //     ),
      //     const SafeArea(
      //       child: SizedBox(
      //         width: double.infinity,
      //         child: Column(
      //           children: [
      //             Text('Cairo, EG'),
      //           ],
      //         ),
      //       ),
      //     ),
      //
      //   ],
      // ),
      body: ScreenBackground(
        isNight: isNight,
        child: Column(
          children: [
            gapH20,
            const CityText(name: 'Cairo, EG'),
            gapH20,
            Icon(
              size: 220,
              isNight
                  ? CupertinoIcons.moon_stars_fill
                  : CupertinoIcons.cloud_sun_fill,
              color: Colors.white,
            ),
            const Text(
              '30°',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            const WeeklyWeatherData(),
            const Spacer(flex: 3),
            //const Expanded(flex: 3, child: SizedBox()),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: _changeDayTime,
                  // onPressed: () {
                  //   print('isNight before pressed: $isNight');
                  //
                  //   setState(() {
                  //     isNight = !isNight;
                  //   });
                  //   print('isNight after pressed: $isNight');
                  // },
                  style: const ButtonStyle(
                    //overlayColor: MaterialStatePropertyAll(Colors.green),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        //side: BorderSide(width: 2),
                      ),
                    ),
                    //minimumSize: MaterialStatePropertyAll(Size(200, 45)),
                  ),
                  child: const Text('Change Day Time'),
                ),
              ),
            ),
            // FractionallySizedBox(
            //   widthFactor: 0.6,
            //   child: SizedBox(
            //     height: 45,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         print('isNight before pressed: $isNight');
            //
            //         isNight = !isNight;
            //
            //         print('isNight after pressed: $isNight');
            //       },
            //       style: const ButtonStyle(
            //         //overlayColor: MaterialStatePropertyAll(Colors.green),
            //         shape: MaterialStatePropertyAll(
            //           RoundedRectangleBorder(
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(8),
            //             ),
            //             //side: BorderSide(width: 2),
            //           ),
            //         ),
            //         //minimumSize: MaterialStatePropertyAll(Size(200, 45)),
            //       ),
            //       child: const Text('Change Day Time'),
            //     ),
            //   ),
            // ),
            const Spacer(flex: 2),
            //const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

class WeeklyWeatherData extends StatelessWidget {
  const WeeklyWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    const gapW20 = SizedBox(width: 20);
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeekDayWeather(
          icon: CupertinoIcons.cloud_sun_fill,
          day: 'WED',
          temp: 29,
        ),
        gapW20,
        WeekDayWeather(
          icon: CupertinoIcons.cloud_sun_fill,
          day: 'THU',
          temp: 29,
        ),
        gapW20,
        WeekDayWeather(
          icon: CupertinoIcons.cloud_sun_fill,
          day: 'FRI',
          temp: 29,
        ),
        gapW20,
        WeekDayWeather(
          icon: CupertinoIcons.cloud_sun_fill,
          day: 'SAT',
          temp: 29,
        ),
        gapW20,
        WeekDayWeather(
          icon: CupertinoIcons.cloud_sun_fill,
          day: 'TUE',
          temp: 29,
        ),
      ],
    );
  }
}

class WeekDayWeather extends StatelessWidget {
  const WeekDayWeather({
    super.key,
    required this.icon,
    required this.temp,
    required this.day,
  });

  final String day;
  final int temp;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        Icon(
          icon,
          size: 45,
          color: Colors.white,
        ),
        Text(
          '$temp°',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}

class CityText extends StatelessWidget {
  const CityText({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400),
    );
  }
}
