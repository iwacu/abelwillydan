import 'package:flutter/material.dart';


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const Color background = Color(0XFFFFFFFF);
 Color whitesmoke=HexColor("#f4f6f9");

 const Color titleTextColor = const Color(0xff1d2635);
 const Color subTitleTextColor = const Color(0xff797878);

 const Color skyBlue = Color(0xff2890c8);
const Color lightBlue = Color(0xff5c3dff);
const Color almostWhite = Color(0xFFF7F3E6);  
Color dshbrd = HexColor("14458C");
 const Color orange = Color(0xffE65829);
 const Color red = Color(0xffF72804);

 const Color lightGrey = Color(0xffE1E2E4);
 const Color grey = Color(0xffA1A3A6);
const Color darkgrey = Color(0xff747F8F);
  
 const Color iconColor = Color(0xffa8a09b);
 const Color yellowColor = Color(0xffF7DFB9);

const Color black = Color(0xff20262C);
 const Color lightblack = Color(0xff5F5F60);
const Color lightpink = Color(0xffe57373);
const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);
const Color yellow = Color(0xffFDC054);
const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];
