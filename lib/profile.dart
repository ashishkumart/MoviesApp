import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: profileContent(),
    );
  }

  Widget profileContent() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(30.0),
        child: Container(
          /// Profile Picture, Name and Email
          child: Center(
            child: Column(
              children: <Widget>[
                /// Profile Picture
                CircleAvatar(
                  child: Icon(
                    Icons.ac_unit,
                    size: 120,
                  ),
                  radius: 60,
                ),

                /// Name
                Text(
                  'Ashish Tiwari',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35),
                ),

                /// Email
                Text(
                  'ashish@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(
                  height: 30,
                ),

                /// Calendar
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      size: 34,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Calendar",
                            style: TextStyle(fontSize: 22),
                          ),
                          padding: EdgeInsets.only(left: 18),
                        ),
                        Container(
                          child: Text(
                            "Calendar",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(
                  height: 30,
                ),

                /// Change Password
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      size: 34,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text(
                        "Chnage Password",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
