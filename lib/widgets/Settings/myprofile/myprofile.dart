import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _switchValue = true;
   bool _switchValu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(LineAwesomeIcons.arrow_left),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(LineAwesomeIcons.alternate_sign_out),
                    onPressed: null)
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('My Profile',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.textMultiplier * 4)),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 64.0,
                        backgroundImage:
                            AssetImage('assets/images/no_image.png'),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Rutayire Willy Pascal',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.textMultiplier * 2.2)),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 1,
                          ),
                          Text('rutayisirewilly@gmail.com',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black38,
                                  fontSize: SizeConfig.textMultiplier * 1.6)),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 4,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: yellowColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Edit'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('Account',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.textMultiplier * 2)),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 4)
                        .copyWith(bottom: SizeConfig.heightMultiplier * 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 4,
                        vertical: SizeConfig.heightMultiplier * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('change Location',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black38,
                                    fontSize: SizeConfig.textMultiplier * 2.2)),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 3,
                            ),
                            Text('Kanombe',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.lightGreen,
                                    fontSize: SizeConfig.textMultiplier * 2.2)),
                            Spacer(),
                            Icon(LineAwesomeIcons.pen)
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                        Row(
                          children: [
                            Text('change Password',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black38,
                                    fontSize: SizeConfig.textMultiplier * 2.2)),
                            Spacer(),
                            Icon(LineAwesomeIcons.pen)
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                        Row(
                          children: [
                            Text('change position',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black38,
                                    fontSize: SizeConfig.textMultiplier * 2.2)),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 3,
                            ),
                            Text('Manager',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.lightGreen,
                                    fontSize: SizeConfig.textMultiplier * 2.2)),
                            Spacer(),
                            Icon(LineAwesomeIcons.pen)
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                      ],
                    ),
                  ),
                ),
                //Notification
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('Notification',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.textMultiplier * 2)),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 4)
                        .copyWith(bottom: SizeConfig.heightMultiplier * 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 4,
                        vertical: SizeConfig.heightMultiplier * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('APP Notification',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black38,
                                    fontSize: SizeConfig.textMultiplier * 2.2)),
                            Spacer(),
                            CupertinoSwitch(
                              value: _switchValue,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                        Row(
                          children: [
                            Text('Location tracking',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black38,
                                    fontSize: SizeConfig.textMultiplier * 2.2)),
                            Spacer(),
                            CupertinoSwitch(
                              value: _switchValu,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
