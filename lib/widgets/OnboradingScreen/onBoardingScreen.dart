import 'package:flutter/material.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';

class OnBoardingScreen extends StatelessWidget {
   final String firstName;
  final String lastName;
  final String email;

  const OnBoardingScreen({Key key, this.firstName, this.lastName, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Spacer(flex: 3,),
                   
                    Text(
                      'WELCOME',
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 4,
                          color: orange,
                          fontWeight: FontWeight.bold),
                    ),
                     Spacer(flex:3),
                     RichText(
                       
                       textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Rutayisire willy pascal',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.textMultiplier * 2)),
                    TextSpan(
                      text:
                          ' after the Manager assigns you a new position Please Sign-Out and Sign-In Again',
                      style: TextStyle(
                        fontFamily: 'Montserrat', color: Colors.grey),
                    ),
                  ]),
                ),
                    //  Text(
                    //     'Rutayisire willy pascal after the Manager assigns you a new position Please Sign-Out and Sign-In Again',
                    //   textAlign: TextAlign.center,style: TextStyle(
                    //       fontFamily: 'Montserrat', color: Colors.grey),),
                   
                        Spacer(flex: 2,),
                        Image.asset('assets/images/splash_2.png',
                        width: SizeConfig.widthMultiplier*80,
                        ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:14),
                  child: Column(
                    children: [
                      Spacer(),
                       Text(
                        'Happy for You to be Part Of Us',
                      textAlign: TextAlign.center,style: TextStyle(
                          fontFamily: 'Montserrat', color: Colors.grey),),
                      Spacer(flex:2),
                      SizedBox(
                        width: double.infinity,
                        height: SizeConfig.heightMultiplier*8,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                          color: orange,
                          onPressed: (){}, 
                        child: Text('Sign-Out',style: TextStyle(
                                  fontFamily: 'Montserrat', color: Colors.white)),
              ),
                      ),
                      Spacer(),
                      
                    ],
                  ),
                ),
                )  ],
          ),
        ),
      ),
    );
  }
}
