import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: SpinKitThreeBounce(
        color: Colors.white,
        size: SizeConfig.imageSizeMultiplier*8,
  
    ),
      ),
    );
  }
}
