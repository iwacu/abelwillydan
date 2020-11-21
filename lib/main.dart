import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/services/API/apiresponsehandl.dart';
import 'package:phonestockmgt/services/Authentication/wrapper.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(() => ApiResponse());
}
void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          //Multi_provider for different streams
          return MaterialApp(
            debugShowCheckedModeBanner: false,
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                primaryColor: almostWhite),
         home: Wrapper(),
          );
        });
      },
    );
  }
}
