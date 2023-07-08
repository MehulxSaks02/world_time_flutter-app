import 'package:flutter/material.dart';
import 'package:world_time_1/package/home.dart';
import 'package:world_time_1/package/loading.dart';
import 'package:world_time_1/package/location.dart';



void main() =>runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/location':(context) => Location(),
    '/':(context)=>Loading(),
    '/home':(context)=>Home(),
  },
));



