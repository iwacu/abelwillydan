import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/allPositions.dart';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';

class UserMenuManagement extends StatefulWidget {
  final Person person;
  final String token;
  final int id;
  final List<AllPositions> positions;

  const UserMenuManagement(
      {Key key, this.person, this.token, this.id, this.positions})
      : super(key: key);

  @override
  _UserMenuManagementState createState() => _UserMenuManagementState();
}

class _UserMenuManagementState extends State<UserMenuManagement> {
  String _dropDownValue = '';
  String _active = '';
  bool _isLoading = false;
  int _positionId;
  @override
  void initState() {
    _dropDownValue = widget.person.positionName==null? 'No Position assigned':widget.person.positionName;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Edit User',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 6),
              Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/no_image.png'),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Center(
                child: Text(
                  '${widget.person.firstname} ${widget.person.lastname}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: SizeConfig.textMultiplier * 2),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Center(
                child: Text(
                  '${widget.person.positionEmail}',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: SizeConfig.textMultiplier * 2),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Column(
                    children: [
                      //previous_position
                             Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8,vertical: 8),
                              child: Text(
                                'Current Position',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            _dropDownValue.isEmpty
                                ? widget.person.positionName == null
                                    ? Expanded(
                                        child: Text(
                                          '  No position assigned',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.orangeAccent,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        '${widget.person.positionName}',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.orangeAccent,
                                        ),
                                      )
                                : Text(
                                    _dropDownValue,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                         ],
                        ),
                      ),
                
                      //new_position
                     widget.person.positionName==null? Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'New Position',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                              ),
                            ),
                            // _dropDownValue.isEmpty
                            //     ? Container(
                            //       width: SizeConfig.widthMultiplier*6,
                            //       child: 
                                   
                            //     )
                                    
                            //     : Text(
                            //         _dropDownValue,
                            //         style: TextStyle(
                            //           fontFamily: 'Montserrat',
                            //           color: Colors.greenAccent,
                            //         ),
                            //       ),
                            DropdownButton(
                              hint:   _dropDownValue == 'null'
                                    ? Text(
                                     '$_dropDownValue',
                                     overflow: TextOverflow.ellipsis,
                                     style: TextStyle(
                                       fontFamily: 'Montserrat',
                                       color: Colors.orangeAccent,
                                     ),
                                   ): Text(
                                   '$_dropDownValue',
                                    overflow: TextOverflow.ellipsis,
                                    
                                   style: TextStyle(
                                     fontFamily: 'Montserrat',
                                     color: Colors.orangeAccent,
                                   ),
                                 ),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                              ),
                              items: widget.positions.map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val.positionName,
                                    onTap: () {
                                      setState(() {
                                        _dropDownValue = val.positionName;
                                        _positionId = val.id;
                                      });
                                      print(_positionId);
                                    },
                                    child: Text(val.positionName),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    _dropDownValue = val;
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ):Container(),
                             widget.person.positionName==null? Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: GestureDetector(
                          onTap: () async {
                            if (_positionId == null) {
                              Fluttertoast.showToast(
                                msg: "Please choose a Position from dropdown menu",
                              );
                            } else {
                              setState(() {
                                _isLoading = true;
                              });
                              final response = await DatabaseServiceProvider()
                                  .assignedPosition(widget.person.positionId,
                                      _positionId, widget.id, widget.token);
                              if (response.statusCode == 200) {
                                print(response.body);
                                setState(() {
                                  _isLoading = false;
                                });

                                Fluttertoast.showToast(
                                  msg: "Position assigned sucessfully",
                                );
                                Navigator.pop(context);
                                Navigator.pop(context);
                              } else {
                                setState(() {
                                  _isLoading = false;
                                });
                                Fluttertoast.showToast(
                                  msg: "A problem occured contact super_Admin",
                                );
                              }
                            }
                          },
                          child: Container(
                            height: 60,
                            width: width / 1.5,
                            decoration: BoxDecoration(
                                gradient: mainButton,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                    offset: Offset(0, 5),
                                    blurRadius: 10.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(9.0)),
                            child: Center(
                              child: Text("Assigned",
                                  style: const TextStyle(
                                      color: const Color(0xfffefefe),
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0)),
                            ),
                          ),
                        ),
                      ):Container()
                    ],
                  ),
                ),
              ),
            ],
          ),
           _isLoading
                  ? Loading()
                  : Container()
         ],
      ),
    );
  }
}
