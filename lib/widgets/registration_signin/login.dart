import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/API/apiresponsehandl.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/services/Authentication/wrapper.dart';
import 'package:phonestockmgt/services/Database/database.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';
import 'package:phonestockmgt/widgets/registration_signin/custompaiting.dart';
import 'package:phonestockmgt/widgets/registration_signin/registration.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DatabaseServiceProvider _auth = DatabaseServiceProvider();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String email = '';
  String password = '';
  String error = '';
  Future _submit() async {
    if (_formKey.currentState.validate()) {
      final result = await _auth.signIn(username: email, password: password);
      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${result.statusCode}');
      print(result.body);
      if (result.statusCode == 200) {
        String response = result.body;
        ApiLoginResponse auth = ApiLoginResponse.fromJson(jsonDecode(response));
        print(auth.token);
        UserDetails userDetails = UserDetails();
        Map<String, dynamic> map = {
          'firstname': auth.firstname,
          'lastname': auth.lastname,
          'email': auth.useremail,
          'token': auth.token,
          'positionName': auth.positionName,
          'positionCode': auth.positionCode
        };
        userDetails.fromMap(map);
        //check if user is manager
        if (auth.positionName == 'Manager' && auth.positionCode == 'P003') {
          print('manager signIn');
          await DatabaseClient().add(userDetails);
          print('donne adding');
          await DatabaseClient().item();
          await DatabaseServiceProvider.setToken(auth.token);
          await ApiResponse().getShopAndPositions(auth.token);
          setState(() {
            _isLoading = false;
          });
          print(userDetails.firstname);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Wrapper()),
          );
        } else {
          print('Not manager signIn');
          await DatabaseClient().add(userDetails);
          print('donne adding');
          await DatabaseClient().item();
          await DatabaseServiceProvider.setToken(auth.token);
          setState(() {
            _isLoading = false;
          });
          print(userDetails.firstname);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Wrapper()),
          );
        }
      } else if (result.statusCode == 400) {
        var errorJson = jsonDecode(result.body)['non_field_errors'];
        List<String> errors = errorJson != null ? List.from(errorJson) : null;
        setState(() {
          _isLoading = false;
          error = errors[0];
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        setState(() {});
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: CustomPaint(
          painter: BackgroundSignIn(),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Text(
                          error,
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'Montserrat',
                              fontSize: SizeConfig.textMultiplier * 3),
                        ),
                      ),
                      //header
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Welcome\nBack',
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                                fontSize: 40),
                          ),
                        ),
                      ),

                      //textformfield
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 14,
                              ),
                              TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'Enter email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email,
                                        color: Colors.black38)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                obscureText: true,
                                validator: (val) =>
                                    val.length < 6 ? ' Enter password' : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(color: Colors.black38),
                                    labelText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black38,
                                    )),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                      //sign in button
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                _submit();
                              },
                              child: Container(
                                height: SizeConfig.heightMultiplier*8,
                                width: SizeConfig.widthMultiplier*14,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: neumorpShadow,
                                    color: Color(0xFFCADCED),
                                  ),
                                  child: Icon(LineAwesomeIcons.arrow_right,color: Colors.black45,),
                              ),
                            
                            )
                          ],
                        ),
                      ),
                      //bottom navig
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()));
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Text(
                              'Forgot Password',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _isLoading
                  ? Loading()
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
