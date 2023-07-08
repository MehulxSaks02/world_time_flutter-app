import 'package:flutter/material.dart';
import 'package:world_time_1/services/Time.dart';


class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override

  State<Location> createState() => _LocationState();
}


class _LocationState extends State<Location> {

  List<Time> locations=[

    Time(url: 'Australia/sydney',location: 'Australia',flag: 'aus.png'),
    Time(url: 'Asia/Kolkata',location: 'India',flag: 'india.png'),
    Time(url:'Asia/Karachi',location: 'Pakistan',flag: 'pakistan.png'),
    Time(url: 'Pacific/Auckland',location: 'New Zealand',flag: 'new zealand.png'),
    Time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    Time(url: 'Africa/Johannesburg',location: 'South Africa',flag: 'south africa.png'),
    Time(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    Time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    Time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south korea.png'),
    Time(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),

  ];

  void updateTime(index) async{
  Time instance=locations[index];
  await instance.getTime();

  // sending data to the home page
    Navigator.pop(context,{
        "location":instance.location,
        "flag":instance.flag,
        "actual_time":instance.actual_time,
        "isDayTime":instance.isDayTime,
        "date":instance.Date,


    });
  }

  @override
  void initState(){
    super.initState();
  }

  @override

  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("LOCATION"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 1.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
