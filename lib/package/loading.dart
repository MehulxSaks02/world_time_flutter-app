import 'package:flutter/material.dart';
import 'package:world_time_1/services/Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setup() async{
  Time example=Time(location: "Bengaluru",url: "/Asia/Kolkata",flag: "india.png");
  await example.getTime();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    "location":example.location,
    "flag":example.flag,
    "actual_time":example.actual_time,
    "isDayTime":example.isDayTime,
  });
}
  @override

  int count=0;
  void initState(){
    super.initState();
    setup();

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
