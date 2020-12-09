import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/widgets/registration_signin/custompaiting.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: CustomPaint(
          painter: BackgroundSignUp(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpinKitThreeBounce(
                  color: Colors.black,
                  size: SizeConfig.imageSizeMultiplier*8,
  
    ),
    Text(
                      'A moment Please..........',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: SizeConfig.textMultiplier * 2),
                    ),
                ],
              ),
      ),
    );
  }
}
