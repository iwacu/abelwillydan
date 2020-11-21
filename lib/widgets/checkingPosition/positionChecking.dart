import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/services/Authentication/wrapper.dart';
import 'package:phonestockmgt/services/Database/database.dart';

class WaitingPosition extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;

  const WaitingPosition({Key key, this.firstName, this.lastName, this.email})
      : super(key: key);

  @override
  _WaitingPositionState createState() => _WaitingPositionState();
}

class _WaitingPositionState extends State<WaitingPosition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 8,
              ),
              Center(
                child: Text('WELCOME',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: SizeConfig.textMultiplier * 4)),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '${widget.firstName} ${widget.lastName}, ',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.textMultiplier * 2)),
                    TextSpan(
                      text:
                          'after the Manager assigns you a new position please sign_out and sign_In again.',
                      style: TextStyle(
                          fontFamily: 'Montserrat', color: Colors.grey),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 8,
              ),
              Image.asset('assets/images/waiting.jpg'),
              SizedBox(
                height: SizeConfig.heightMultiplier * 14,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Sign Out   ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: SizeConfig.textMultiplier * 2.4)),
                IconButton(
                    icon: Icon(LineAwesomeIcons.alternate_sign_out),
                    onPressed: () async{
                   await DatabaseClient().drop(); 
                   await DatabaseServiceProvider.removeToken();
                   Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Wrapper()),
          (route) => route.isFirst);
                          
                 },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
