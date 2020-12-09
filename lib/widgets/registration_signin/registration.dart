import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/services/Authentication/wrapper.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';
import 'package:phonestockmgt/widgets/registration_signin/custompaiting.dart';


class SignUpPage extends StatefulWidget {
  final Function toggleView;
  SignUpPage({this.toggleView});
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   DatabaseServiceProvider _auth = DatabaseServiceProvider();
  String firstname='';
  String lastname='';
  String email='';
  String password=''; 
  String password2='';
  String error='';
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  Future _submit() async{
         if (_formKey.currentState.validate()) {
            final result = await _auth.register(email: email,firstname:firstname,lastname: lastname,password2: password2,password: password);
            print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${result.statusCode}');
            if(result.statusCode==200){
                setState(() {
                        _isLoading=false;
                      });
                   Navigator.push( context, MaterialPageRoute(builder: (context) => Wrapper()),);
                   Fluttertoast.showToast(msg: "registration done",);
              }
              else if(result.statusCode ==400){
             var errorJson = jsonDecode(result.body)['non_field_errors'];
       List<String> errors = errorJson!= null ? List.from(errorJson) : null;
     setState(() {
  _isLoading =false;
  error=errors[0];
});
              }
              else{
                setState(() {
                  _isLoading =false;
                  error='Email does not exist';
                });
              }
         }
     


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Form(
                 key: _formKey,
                              child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:14),
                      child: Text(error, style: TextStyle(
            color: Colors.redAccent, fontFamily: 'Montserrat', fontSize: SizeConfig.textMultiplier*3),),
                    ),
                    //header
                   Expanded(
    flex: 3,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Create\nAccount',
        style: TextStyle(
            color: Colors.black45, fontWeight: FontWeight.w300,fontFamily: 'Montserrat', fontSize: 40),
      ),
    ),
  ),
                    //Textform field
                    Expanded(
                      flex: 4,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black45)),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.black45)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter your firstname' : null,
                              onChanged: (val) {
                                setState(() => firstname = val);
                              },
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black45)),
                                  labelText: 'Firstname',
                                  labelStyle: TextStyle(color: Colors.black45)),
                            ),
                             SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter your lastname' : null,
                              onChanged: (val) {
                                setState(() => lastname = val);
                              },
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black45)),
                                  labelText: 'Lastname',
                                  labelStyle: TextStyle(color: Colors.black45)),
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
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black45)),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.black45)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (val) =>
                                  val.length < 6 ? ' repeat password' : null,
                              onChanged: (val) {
                                setState(() => password2 = val);
                              },
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black45)),
                                  labelText: 'Repeat Password',
                                  labelStyle: TextStyle(color: Colors.black45)),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
//Sign_In button field
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 25,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () async{
                               setState(() {
                            _isLoading =true;
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
                              )
                          )
                        ],
                      ),
                    ),
                    Expanded(
    flex: 1,
    child: Row(
     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
         '',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ),
  ),
                  ],
                ),
              ),
            ),
          _isLoading
                  ? Loading()
                  : Container() ],
        ),
      ),
    );
  }
}
