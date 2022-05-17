import 'package:flutter/material.dart';
import 'package:world_time/pages.dart/change_location.dart';
import 'package:world_time/pages.dart/home_screen.dart';
import 'package:world_time/pages.dart/loading.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoadingScreen(),
          'home': (context) => HomeScreen(),
          '/location': (context) => LocationSelection(),
        },
      ),
    );
