import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*8),
        padding: EdgeInsets.all(8),
        width: SizeConfig.widthMultiplier*12,
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
