import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //the location name for the url
  late String time; //the location time
  String flag; //the flag icon for the location
  String url; //the url end point for the reqion and tume zone
  late bool isDayTime;

  WorldTime(
      {required this.location,
      // required this.time,
      required this.flag,
      required this.url});

  Future<void> getTime() async {
    try {
      //make the request
      http.Response response = await http.get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$url'),
      );
      // get the data
      Map data = jsonDecode(response.body);
      // print(data);
      // print(data['timezone']);

      // get properties from data
      String dateTime = data['utc_datetime'];
      String offSet = data['utc_offset'].substring(1, 3);

      // print(dateTime);
      // print(offSet);

      // create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet)));
      // print(now);
      isDayTime = now.hour > 5 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('error caught is : $e');
      time = 'could not get the time at this time, try again later';
    }
  }
}
