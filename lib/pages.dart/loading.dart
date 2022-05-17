// import 'dart:ffi';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import '../services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setupWorldTime() async {
    WorldTime oya = WorldTime(
      location: 'London',
      flag: 'germany.png',
      url: 'Europe/London',
      // time: '',
    );
    await oya.getTime();
    print(oya.time);
    Navigator.pushReplacementNamed(context, 'home', arguments: {
      'location': oya.location,
      'time': oya.time,
      'flag': oya.flag,
      'isDayTime': oya.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    // getTime();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
