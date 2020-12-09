import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/services/Authentication/wrapper.dart';
import 'package:phonestockmgt/services/Database/database.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>with AutomaticKeepAliveClientMixin  {
  bool _switchValue = true;
   bool _switchValu = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: StreamBuilder(
       stream: DatabaseClient().item().asStream(),
        builder: (context,AsyncSnapshot<UserDetails>snapshot){
          return snapshot.data==null?Loading():  SafeArea(
                      child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 6,
                ),
                     Align(
                      alignment: Alignment.topRight,
                                          child: GestureDetector(
                                   onTap: () async {
                                      await DatabaseClient().drop();
                                    await DatabaseServiceProvider.removeToken();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Wrapper()),
                                        (route) => route.isFirst);
                                   },
                                   child: Padding(
                                     padding: EdgeInsets.only(right:12),child: Container(
                                       height: 50,
                                       width: 50,
                                       decoration: BoxDecoration(
                                           shape: BoxShape.circle,
                                           boxShadow: neumorpShadow,
                                           color: Color(0xFFCADCED),
                                       ),
                                       child: Stack(
                                           children: [
                                             Center(
                                               child: Container(
                                                 decoration: BoxDecoration(
                                                   shape: BoxShape.circle,
                                                   color: Colors.white38,
                                                 ),
                                               ),
                                             ),
                                             Center(
                                               child: Container(
                                                 margin: EdgeInsets.all(6),
                                                 decoration: BoxDecoration(
                                                   shape: BoxShape.circle,
                                                   color: Color(0xFFCADCED),
                                                 ),
                                                 child: Icon(
                                                   LineAwesomeIcons.alternate_sign_out,
                                                   color: skyBlue,
                                                 ),
                                               ),
                                             )
                                           ],
                                       ),
                                     ),
                                   ),
                                 ),
                     ),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text('My Profile',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.textMultiplier * 4)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                               //   shape: BoxShape.circle,
                                                  boxShadow: neumorpShadow,
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color(0xFFCADCED),
                                                ),
                                                child: Icon(
                                                          LineAwesomeIcons.user_1,
                                                          color: skyBlue,
                                                          size: 7 * SizeConfig.imageSizeMultiplier,
                                                        )
                                              ),
                                              SizedBox(width: SizeConfig.widthMultiplier*4,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('${snapshot.data.firstname} ${snapshot.data.lastname}',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.textMultiplier * 2.2)),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier * 1,
                                ),
                                Text('${snapshot.data.useremail} ',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black38,
                                        fontSize: SizeConfig.textMultiplier * 1.6)),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier * 4,
                                ),
                                
                                 ],
                            ),
                          ],
                        ),
                      ),
                          Spacer(),
                          Padding(
                            padding:EdgeInsets.only(left: 18,right: 18),
                            child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    '${snapshot.data.positionName}',
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .textMultiplier *
                                                            1.9,
                                                        fontFamily: 'Montserrat',
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black38),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: SizeConfig
                                                                .heightMultiplier *
                                                            4,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          boxShadow: neumorpShadow,
                                                          color: Color(0xFFCADCED),
                                                        ),
                                                        child: Icon(
                                                          LineAwesomeIcons
                                                              .crosshairs,
                                                          color: skyBlue,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: SizeConfig
                                                                .widthMultiplier *
                                                            1.2,
                                                      ),
                                                      Text(
                                                        'My Position',
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .textMultiplier *
                                                                1.9,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.black45),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                color: Colors.white,
                                                width: 0.2,
                                                height:
                                                    SizeConfig.heightMultiplier * 5,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    'Kanombe',
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .textMultiplier *
                                                            1.9,
                                                        fontFamily: 'Montserrat',
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black38),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: SizeConfig
                                                                .heightMultiplier *
                                                            4,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          boxShadow: neumorpShadow,
                                                          color: Color(0xFFCADCED),
                                                        ),
                                                        child: Icon(
                                                          LineAwesomeIcons.map_pin,
                                                          color: skyBlue,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: SizeConfig
                                                                .widthMultiplier *
                                                            1.2,
                                                      ),
                                                      Text(
                                                        'My Shop',
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .textMultiplier *
                                                                1.9,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.black38),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                          ),
                     Spacer(),
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
                                  Text('${snapshot.data.positionName} ',
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
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
