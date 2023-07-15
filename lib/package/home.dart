import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Map data={};


  Widget build(BuildContext context) {


     data=data.isNotEmpty? data:ModalRoute.of(context)!.settings.arguments as Map;

    print(data);

    String bgImage= data['isDayTime'] ? 'day.jpg':'night.jpg';
    Color bgcolor=data['isDayTime'] ? Colors.black: Colors.white;
    Color bg= data['isDayTime'] ? Colors.blue:Colors.indigo;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
            child: Column(
              children: [
                ElevatedButton.icon(

                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result!=null)
                      {
                        setState(() {
                          data=result;
                        });
                      }
                  },

                  icon:Icon(Icons.edit_location,
                  color: Colors.grey[300],
                  ),

                  label: Text("Loaction",style: TextStyle(color: Colors.grey[300]),),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: bgcolor,
                    ),),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(data['actual_time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color:bgcolor,
                ),),
                SizedBox(height: 20.0,),


              ],

            ),
          ),
        ),
      ),

    );
  }
}



