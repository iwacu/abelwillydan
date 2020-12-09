import 'package:flutter/material.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';


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
final kTitleTextStyle = TextStyle(
  fontSize: SizeConfig.textMultiplier*2.6,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: SizeConfig.textMultiplier*2.2,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: SizeConfig.textMultiplier*2.4,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);
final kSliderTextStyle = TextStyle(
  fontSize: SizeConfig.textMultiplier*2.4,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
final kSliderCaptionTextStyle = TextStyle(
  fontSize: SizeConfig.textMultiplier*1.5,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kDarkPrimaryColor = Color(0xFF212121);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);
////////////////////////// 
const backgroundColor= Color(0XffCDDEEC);
List<BoxShadow> softUiShadow = [
  BoxShadow(
    color: Colors.white,
    offset: Offset(-5, -5),
    spreadRadius: 1,
    blurRadius: 15,
  ),
  BoxShadow(
    color: Color(0XFF748CAC).withOpacity(.6),
    offset: Offset(5, 5),
    spreadRadius: 1,
    blurRadius: 15,
  ),
];
const activeGradient = LinearGradient(
  colors: <Color>[
    Color(0Xffc94b4b),
    Color(0Xff4b134f),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
///////////////
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const Color background = Color(0XFFFFFFFF);
 Color whitesmoke=HexColor("#6c60e0");
 Color dri1=HexColor("#fef6f9");
 Color dri2=HexColor("#f7faff");
 Color dri3=HexColor("#d7efff");
 Color dri4=HexColor("#ffdfcd");
 Color dri5=HexColor("#b9eedc");
 Color dri6=HexColor("#e0d7ff");
 const kSe4ondaryColor = Color(0xFF979797);
const kTex4Color = Color(0xFF757575);
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
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);


class SizeCofig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeCofig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeCofig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

   List<BoxShadow> neumorpShadow = [
    BoxShadow(
        color: Colors.white.withOpacity(0.5), spreadRadius: -5, offset: Offset(-5, -5), blurRadius: 30),
    BoxShadow(
        color: Colors.blue[900].withOpacity(.2),
        spreadRadius: 2,

        offset: Offset(7, 7),
        blurRadius: 20)
  ];