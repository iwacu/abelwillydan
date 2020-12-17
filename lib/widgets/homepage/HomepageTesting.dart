// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:phonestockmgt/constant/colors.dart';
// import 'package:phonestockmgt/constant/sizeconfig.dart';
// import 'package:phonestockmgt/models/allPositions.dart';
// import 'package:phonestockmgt/models/allShops.dart';
// import 'package:phonestockmgt/models/userdetails.dart';
// import 'package:phonestockmgt/services/API/apis.dart';
// import 'package:phonestockmgt/services/Authentication/wrapper.dart';
// import 'package:phonestockmgt/services/Database/database.dart';
// import 'package:phonestockmgt/widgets/AdminPage/storeManagment.dart';
// import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';
// import 'package:phonestockmgt/widgets/stockIn/stockIn.dart';
// import 'package:phonestockmgt/widgets/stockout/stockOut.dart';
// import 'package:provider/provider.dart';

// class HomePageTesting extends StatefulWidget {
//   @override
//   _HomePageTestingState createState() => _HomePageTestingState();
// }

// class _HomePageTestingState extends State<HomePageTesting> {
                 
//   @override
//   Widget build(BuildContext context) {
//       DateTime now = DateTime.now();
      
//    String formattedDate = DateFormat('EEE d, MMM yyy').format(now);
 
//     final _allPositions=Provider.of<List<AllPositions>>(context);
//      final _allShops=Provider.of<List<AllShop>>(context);
   
//     return WillPopScope(
//        onWillPop: () async => false,
//           child: Scaffold(
//         backgroundColor: Color(0xFFCADCED),
//         body: StreamBuilder(
//             stream: DatabaseClient().item().asStream(),
//             builder: (context, AsyncSnapshot<UserDetails> snapshot) {
//               return snapshot.data == null
//                   ? Loading()
//                   : SafeArea(
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: SizeConfig.heightMultiplier * 3,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text('Today,',
//                                     style: TextStyle(
//                                         fontSize: SizeConfig.textMultiplier * 2.6,
//                                         fontFamily: 'Montserrat',
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black38)),
//                                 SizedBox(width: SizeConfig.widthMultiplier * 1.8),
//                                 Text(formattedDate,
//                                     style: TextStyle(
//                                         fontSize: SizeConfig.textMultiplier * 1.8,
//                                         fontFamily: 'Montserrat',
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black)),
//                                 Spacer(),
//                                 GestureDetector(
//                                   onTap: () async {
//                                     await DatabaseClient().drop();
//                                     await DatabaseServiceProvider.removeToken();
//                                     Navigator.pushAndRemoveUntil(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => Wrapper()),
//                                         (route) => route.isFirst);
//                                   },
//                                   child:
//                                    Container(
//                                     height: 50,
//                                     width: 50,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       boxShadow: neumorpShadow,
//                                       color: Color(0xFFCADCED),
//                                     ),
//                                     child: Stack(
//                                       children: [
//                                         Center(
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Colors.white38,
//                                             ),
//                                           ),
//                                         ),
//                                         Center(
//                                           child: Container(
//                                             margin: EdgeInsets.all(6),
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Color(0xFFCADCED),
//                                             ),
//                                             child: Icon(
//                                               LineAwesomeIcons.alternate_sign_out,
//                                               color: skyBlue,
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: SizeConfig.heightMultiplier * 3,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8, right: 8),
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 8, vertical: 8),
//                               height: SizeConfig.heightMultiplier * 25,
//                               decoration: BoxDecoration(
//                                   boxShadow: neumorpShadow,
//                                   color: Color(0xFFCADCED),
//                                   borderRadius: BorderRadius.circular(20)),
//                               child: Stack(
//                                 children: [
//                                   Positioned.fill(
//                                     top: SizeConfig.heightMultiplier * 6,
//                                     bottom: -SizeConfig.heightMultiplier * 6,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           boxShadow: neumorpShadow,
//                                           shape: BoxShape.circle,
//                                           color: Colors.white38),
//                                     ),
//                                   ),
//                                   Positioned.fill(
//                                     top: -SizeConfig.heightMultiplier * 10,
//                                     left: -SizeConfig.heightMultiplier * 49,
//                                     bottom: -SizeConfig.heightMultiplier * 10,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           boxShadow: neumorpShadow,
//                                           shape: BoxShape.circle,
//                                           color: Colors.white38),
//                                     ),
//                                   ),
//                                   Positioned.fill(
//                                     top: SizeConfig.heightMultiplier * 3,
//                                     left: SizeConfig.widthMultiplier * 3,
//                                     bottom: SizeConfig.heightMultiplier * 3,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text('Hello',
//                                                 style: TextStyle(
//                                                     fontSize: SizeConfig
//                                                             .textMultiplier *
//                                                         2,
//                                                     fontFamily: 'Montserrat',
//                                                     fontWeight: FontWeight.w600,
//                                                     color: Colors.black)),
//                                             SizedBox(
//                                                 width:
//                                                     SizeConfig.widthMultiplier *
//                                                         2),
//                                             Text('${snapshot.data.firstname}',
//                                                 style: TextStyle(
//                                                     fontSize: SizeConfig
//                                                             .textMultiplier *
//                                                         2,
//                                                     fontFamily: 'Montserrat',
//                                                     fontWeight: FontWeight.w600,
//                                                     color: Colors.black38)),
//                                                      SizedBox(
//                                                 width:
//                                                     SizeConfig.widthMultiplier *
//                                                         2),
//                                           SvgPicture.asset('assets/icons/waving.svg')
                                                
//                                           ],
//                                         ),
//                                         Text(
//                                           'Welcome Back',
//                                           style: TextStyle(
//                                               fontFamily: 'Montserrat',
//                                               fontWeight: FontWeight.w600,
//                                               color: Colors.black38,
//                                               fontSize:
//                                                   SizeConfig.textMultiplier * 2),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   '${snapshot.data.positionName}',
//                                                   style: TextStyle(
//                                                       fontSize: SizeConfig
//                                                               .textMultiplier *
//                                                           1.9,
//                                                       fontFamily: 'Montserrat',
//                                                       fontWeight: FontWeight.bold,
//                                                       color: Colors.black38),
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Container(
//                                                       height: SizeConfig
//                                                               .heightMultiplier *
//                                                           4,
//                                                       decoration: BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         boxShadow: neumorpShadow,
//                                                         color: Color(0xFFCADCED),
//                                                       ),
//                                                       child: Icon(
//                                                         LineAwesomeIcons
//                                                             .crosshairs,
//                                                         color: skyBlue,
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: SizeConfig
//                                                               .widthMultiplier *
//                                                           1.2,
//                                                     ),
//                                                     Text(
//                                                       'My Position',
//                                                       style: TextStyle(
//                                                           fontSize: SizeConfig
//                                                                   .textMultiplier *
//                                                               1.9,
//                                                           fontFamily:
//                                                               'Montserrat',
//                                                           fontWeight:
//                                                               FontWeight.w300,
//                                                           color: Colors.black45),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                             Container(
//                                               color: Colors.white,
//                                               width: 0.2,
//                                               height:
//                                                   SizeConfig.heightMultiplier * 5,
//                                             ),
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   'Kanombe',
//                                                   style: TextStyle(
//                                                       fontSize: SizeConfig
//                                                               .textMultiplier *
//                                                           1.9,
//                                                       fontFamily: 'Montserrat',
//                                                       fontWeight: FontWeight.bold,
//                                                       color: Colors.black38),
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Container(
//                                                       height: SizeConfig
//                                                               .heightMultiplier *
//                                                           4,
//                                                       decoration: BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         boxShadow: neumorpShadow,
//                                                         color: Color(0xFFCADCED),
//                                                       ),
//                                                       child: Icon(
//                                                         LineAwesomeIcons.map_pin,
//                                                         color: skyBlue,
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: SizeConfig
//                                                               .widthMultiplier *
//                                                           1.2,
//                                                     ),
//                                                     Text(
//                                                       'My Shop',
//                                                       style: TextStyle(
//                                                           fontSize: SizeConfig
//                                                                   .textMultiplier *
//                                                               1.9,
//                                                           fontFamily:
//                                                               'Montserrat',
//                                                           fontWeight:
//                                                               FontWeight.w300,
//                                                           color: Colors.black38),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: SizeConfig.heightMultiplier * 3,
//                           ),
//                           Center(
//                             child: Text('Main Dashboard',
//                                 style: TextStyle(
//                                     fontSize: SizeConfig.textMultiplier * 2.6,
//                                     fontFamily: 'Montserrat',
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black38)),
//                           ),
//                           SizedBox(width: SizeConfig.widthMultiplier * 2),
//                           SizedBox(
//                             height: SizeConfig.heightMultiplier * 3,
//                           ),
//                           GridDashboard(
//                             token: snapshot.data.token,
//                             allPositions: _allPositions,
//                             allShops: _allShops,
//                             user: snapshot.data,
//                           )
//                         ],
//                       ),
//                     );
//             }),
//       ),
//     );
//   }
// }

// class GridDashboard extends StatelessWidget {
//   final String token;
//   final List<AllPositions> allPositions;
//   final List<AllShop> allShops;
//  final UserDetails user;
//   GridDashboard({Key key, this.token, this.allPositions, this.allShops, this.user}) : super(key: key);

//   Items item1 = new Items(
//     index: 1,
//     title: "Notifications",
//     subtitle: "",
//     event: "",
//     img: LineAwesomeIcons.bell_1,
//     color: dri1,
//   );

//   Items item2 = new Items(
//     index: 2,
//     title: "Search",
//     subtitle: "",
//     event: "",
//     img: LineAwesomeIcons.search,
//     color: dri2,
//   );
//   Items item3 = new Items(
//     index: 3,
//     title: "In Stock",
//     subtitle: "",
//     event: "",
//     img: LineAwesomeIcons.caret_square_down_1,
//     widget: StockIn(),
//     color: dri2,
//   );
//   Items item4 = new Items(
//     index: 4,
//     title: "Out Stock",
//     subtitle: "",
//     event: "",
//     img: LineAwesomeIcons.caret_square_up_1,
//     widget: StockOut(),
//     color: dri1,
//   );
//   Items item5 = new Items(
//     index: 5,
//     title: "Store Management",
//     subtitle: "",
//     event: "",
//     img: LineAwesomeIcons.store,
//     color: dri1,
//   );
//   Items item6 = new Items(
//     index: 6,
//     title: "My Profile",
//     subtitle: "",
//     event: "",
//     img: LineAwesomeIcons.user_1,
//     color: dri2,
//   );

//   @override
//   Widget build(BuildContext context) {
//     List<Items> myList = [item1, item2, item3, item4, item5, item6];
//     return Flexible(
//       child: GridView.count(
//           childAspectRatio: 1.0,
//           padding: EdgeInsets.only(left: 16, right: 16),
//           crossAxisCount: 2,
//           crossAxisSpacing: 18,
//           mainAxisSpacing: 18,
//           children: myList.map((data) {
//             return GestureDetector(
//               onTap: () {
//                 if (data.index == 5) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => StoreManagement(
//                           allPositions: allPositions,
//                           allShops: allShops,
//                               token: token,
//                               user: user,
//                             )),
//                   );
//                 } else    if (data.index == 3) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => StockIn(
                             
//                             )),
//                   );
//                 } else    if (data.index == 4) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => StockOut(
                             
//                             )),
//                   );
//                 } else {
//                   print(data.index);
//                 }
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 3),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       boxShadow: neumorpShadow,
//                       color: data.color,
//                       borderRadius: BorderRadius.circular(10)),
//                   child:        Column(
//                           children: <Widget>[
//                             Align(
//                               alignment: Alignment.center,
//                                                           child: Padding(
//                                                             padding: const EdgeInsets.only(top:8,right:8.0),
//                                                             child: Container(
//                                                             height: 70,
//                                       width: 70,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         boxShadow: neumorpShadow,
//                                         color: Color(0xFFCADCED),
//                                       ),
//                                       child: Stack(
//                                         children: [
//                                           Center(
//                                             child: Container(
//                                                              height: 47,
//                                       width: 47,
                                      
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 color: Colors.white38,
//                                               ),
//                                             ),
//                                           ),
//                                           Center(
//                                             child: Container(
//                                                                     height: 45,
//                                       width: 45,
                                       
//                                               margin: EdgeInsets.all(6),
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 color: Color(0xFFCADCED),
//                                               ),
//                                               child: Icon(
                                                
//                                 data.img,
//                                 color: skyBlue,
//                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                                           ),
//                             ),
                            
//                             SizedBox(
//                               height: SizeConfig.heightMultiplier*3,
//                             ),
//                             Text(
//                               data.title,
//                               style: kCaptionTextStyle,
//                             ),
                           
//                           ],
//                         ),
                 
//                 ),
//               ),
//             );
//           }).toList()),
//     );
//   }
// }

// class Items {
//   int index;
//   String title;
//   String subtitle;
//   String event;
//   IconData img;
//   Widget widget;
//   Color color;
//   Items(
//       {this.index,
//       this.title,
//       this.subtitle,
//       this.event,
//       this.img,
//       this.widget,
//       this.color});
// }
