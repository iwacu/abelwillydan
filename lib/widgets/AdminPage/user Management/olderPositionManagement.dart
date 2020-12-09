import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/allPositions.dart';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/widgets/AdminPage/user%20Management/EditOlderPosition.dart';
class OlderPositionManagement extends StatefulWidget {
  final String token;
  final UserDetails user;
  final List<Person> allUsers;
  final List<AllPositions> allPositions;
  const OlderPositionManagement(
      {Key key, this.allUsers, this.allPositions, this.token, this.user})
      : super(key: key);
  @override
  _OlderPositionManagementState createState() => _OlderPositionManagementState();
}

class _OlderPositionManagementState extends State<OlderPositionManagement> {
  @override
  Widget build(BuildContext context) {
    var idp = widget.allUsers
        .where((element) => element.positionEmail == widget.user.useremail)
        .single;
    int id = idp.positionId;
    return Scaffold(
     // backgroundColor: Color(0xFFCADCED),
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
                Text('Edit Users Position',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: SizeConfig.textMultiplier * 2.4)),
                IconButton(icon: Icon(LineAwesomeIcons.search), onPressed: null)
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: widget.allUsers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: widget.allUsers[index].positionName !=
                                                  null?
                                                   Container(
                        height: SizeConfig.heightMultiplier * 20,
                       
                        child: Column(
                          children: [
                            Container(
                              height: SizeConfig.heightMultiplier * 20,
                              decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: neumorpShadow,
                              color: dri2,
                        ),
                              child: Column(
                                children: <Widget>[
                                  //FIRST_ROW
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 15, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        widget.allUsers[index].positionName ==
                                                null
                                            ? Icon(
                                                LineAwesomeIcons.user_check,
                                                color: Colors.redAccent,
                                              )
                                            : Icon(
                                                LineAwesomeIcons.user_check,
                                                color: Colors.greenAccent,
                                              ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 3),
                                          child: Text(
                                              '${widget.allUsers[index].firstname} ${widget.allUsers[index].lastname}',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: SizeConfig
                                                          .textMultiplier *
                                                      2.2)),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                       EditOlderUserPositions(
                                                          person: widget
                                                              .allUsers[index],
                                                          positions: widget
                                                              .allPositions,
                                                          id: id,
                                                          token: widget.token,
                                                        )),
                                              );
                                            },
                                            child: 
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:8,
                                                vertical:8
                                              ),
                                height: SizeConfig.heightMultiplier*5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: neumorpShadow,
                                    color: Color(0xFFCADCED),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(LineAwesomeIcons.edit_1,color: Colors.black45,size: 5*SizeConfig.imageSizeMultiplier,),
                                      Text(
                                              'Edit',
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                                                color: Colors.black38,
                                              ),
                                            ),
                                    ],
                                  ),
                              ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            widget.allUsers[index]
                                                        .status ==
                                                    null || widget.allUsers[index]
                                                        .status ==
                                                    'innactive'
                                                ? Container(
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        4,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        3,
                                                    decoration: BoxDecoration(
                                                        color: Colors.redAccent,
                                                        shape: BoxShape.circle),
                                                  )
                                                : Container(
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        4,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        3,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.greenAccent,
                                                        shape: BoxShape.circle),
                                                  ),
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        34,
                                                child: Text(
                                                  '${widget.allUsers[index].positionEmail}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Email',
                                                style: TextStyle(
                                                  //fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                'Feb-21',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Date-In',
                                                style: TextStyle(
                                                  //fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'Position',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8, left: 8),
                                          child: widget.allUsers[index]
                                                      .positionName ==
                                                  null
                                              ? Text(
                                                  'not assigned',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.redAccent),
                                                )
                                              : Text(
                                                  '${widget.allUsers[index].positionName}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.green,
                                                  ),
                                                )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ):Container(),
                    );
                  }))
        ],
      ),
    );
  }
}
