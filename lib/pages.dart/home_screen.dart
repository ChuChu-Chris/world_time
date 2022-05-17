import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    // var txt = "location";

    print(data);
    // set background
    String bgImg = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/location'),
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
