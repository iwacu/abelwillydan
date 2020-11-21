import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/Database/database.dart';
import 'package:provider/provider.dart';

class Myhomepage extends StatefulWidget {
  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage>
    with AutomaticKeepAliveClientMixin {
  //      @override
  // void initState() {
  //   super.initState();
  //   BackButtonInterceptor.add(myInterceptor);
  // }

  // @override
  // void dispose() {
  //   BackButtonInterceptor.remove(myInterceptor);
  //   super.dispose();
  // }

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   print("BACK BUTTON!"); // Do some stuff.
  //   return true;
  // }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _userDetails=Provider.of<UserDetails>(context);
    return Scaffold(
        body: StreamBuilder(
     stream: DatabaseClient().item().asStream(),
    builder: (context, AsyncSnapshot<UserDetails>snapshot) {
      return snapshot.data==null?CircularProgressIndicator(): Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 55, right: 0, left: 0, bottom: 0),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                        color: whitesmoke,
                        borderRadius: BorderRadius.circular(29.5),
                      ),
                      child: Stack(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              icon: SvgPicture.asset("assets/icons/search.svg"),
                              border: InputBorder.none,
                            ),
                          ),
                          Positioned(
                              top: 12,
                              right: 0.0,
                              child: GestureDetector(
                                onTap: () async{
                                   DatabaseClient _service = DatabaseClient();
                                await  _service.allShops();
                               },
                                child: Container(
                                    height: 20,
                                    child: Image.asset(
                                        'assets/images/barcodeScanner.png')),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, right: 10, left: 10, bottom: 0),
                    child: Container(
                      height: SizeConfig.heightMultiplier * 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whitesmoke,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, right: 10, left: 10, bottom: 0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Today 2,October,2020',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black38,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2.2)),
                                Text('Announcement',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.5)),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 4,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'To All emplyees , we have a meeting at 2PM, everyone must at......',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.5)),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text('17 Announcement today',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black45,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.5)),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: yellowColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(LineAwesomeIcons.bell),
                                          SizedBox(
                                            width: SizeConfig.widthMultiplier *
                                                0.4,
                                          ),
                                          Text('View all',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: SizeConfig
                                                          .textMultiplier *
                                                      1.5)),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Store details',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Row(
                          children: [
                            Text('view more',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black38,
                                    fontSize: SizeConfig.textMultiplier * 2.2)),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 1,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: yellowColor,
                              ),
                              child: Icon(EvaIcons.arrowIosForward),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whitesmoke,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                child: Image.asset('assets/images/in.png',
                                    color: skyBlue),
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 4,
                              ),
                              Text('Stock-In',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black38,
                                      fontSize:
                                          SizeConfig.textMultiplier * 2.2)),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 2,
                              ),
                              Row(
                                children: [
                                  Text('32',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2)),
                                  SizedBox(
                                      width: SizeConfig.widthMultiplier * 1),
                                  Text('pcs',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black38,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whitesmoke,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                child: Image.asset(
                                  'assets/images/out.png',
                                  color: Colors.lightGreen,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 4,
                              ),
                              Text('Stock-out',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black38,
                                      fontSize:
                                          SizeConfig.textMultiplier * 2.2)),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 2,
                              ),
                              Row(
                                children: [
                                  Text('12',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2)),
                                  SizedBox(
                                      width: SizeConfig.widthMultiplier * 1),
                                  Text('pcs',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black38,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whitesmoke,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                child: Image.asset('assets/images/return.png',
                                    color: Colors.redAccent),
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 4,
                              ),
                              Text('Returned',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black38,
                                      fontSize:
                                          SizeConfig.textMultiplier * 2.2)),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 2,
                              ),
                              Row(
                                children: [
                                  Text('2',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2)),
                                  SizedBox(
                                      width: SizeConfig.widthMultiplier * 1),
                                  Text('pcs',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black38,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sales',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Row(
                          children: [
                            Text('view All',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black38,
                                    fontSize: SizeConfig.textMultiplier * 2.2)),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 1,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: yellowColor,
                              ),
                              child: Icon(EvaIcons.arrowIosForward),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 20,
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: whitesmoke,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(LineAwesomeIcons.mobile_phone),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('Imei :',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black38,
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        2.2)),
                                            Text(' 1203992884838383',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        2.2)),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.heightMultiplier *
                                                    1.2),
                                        Text('Sold bY :Rutayisire',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black38,
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        2.2)),
                                      ],
                                    ),
                                    Container(
                                      height: 20,
                                      child: Image.asset(
                                        'assets/images/out.png',
                                        color: Colors.lightGreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 18, right: 18),
            child: Container(
              height: SizeConfig.heightMultiplier * 8,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Hello',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.textMultiplier * 2.3)),
                      SizedBox(height: SizeConfig.heightMultiplier * 1.2),
                      Text('${snapshot.data.firstname}',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.textMultiplier * 2.2))
                    ],
                  ),
                  CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage('assets/images/no_image.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;
}
