import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class Time{
  late String location;//location name for the ui
  late String url;//url to an api or endpoint
  late String actual_time;//time in that paricular location
  late String flag;//url to an asset flag icon
  late bool isDayTime;// true or false based on isdaytime or not
  late String Date;

  Time({required this.location,required this.url,required this.flag});

  Future<void> getTime() async {

   try{

     // making the http request

     Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
     // conveting the string to json object
     Map data = jsonDecode(response.body);
     print(data);
     String Date=data['utc_datetime'].substring(0,10);


     // getting the properties from the data

     String time=data['utc_datetime'];
     String offset_hours=data['utc_offset'].substring(1,3);

     String offset_minutes=data['utc_offset'].substring(4,6);

     // print(time);
     // print(offset);
     // print(offset_minutes);

     // creating the datetime object

     DateTime now=DateTime.parse(time);
     DateTime date=DateTime.parse(Date);
     now=now.add(Duration(hours: int.parse(offset_hours),minutes: int.parse(offset_minutes)));

     // set the time property

     isDayTime= now.hour > 6 && now.hour< 19? true:false;
     actual_time=DateFormat.jm().format(now);
     Date= DateFormat.jm().format(date);
   }
   catch(e){
     print("error caught:$e");
     actual_time="time could not be fetched";
   }
  }
}