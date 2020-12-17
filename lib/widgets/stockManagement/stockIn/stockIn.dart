import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/testingmodels.dart';
import 'package:phonestockmgt/widgets/stockManagement/stockIn/addStock.dart';

class StockIn extends StatefulWidget {
  @override
  _StockInState createState() => _StockInState();
}

class _StockInState extends State<StockIn> with AutomaticKeepAliveClientMixin{
  List<Stock> plo = [
  Stock(
      id: 1,
      title: 'Infinx note 7 Lite',
      description: '5',
      color: 'Green'),
  Stock(
      id: 1,
      title: 'Infinx note 7 Lite',
      description: '5',
      color: 'Green'),
  Stock(
      id: 1,
      title: 'Infinx note 7 Lite',
      description: '5',
      color: 'Green'),
];


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "btn+",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStock()),
          );
        },
        elevation: 0.0,
        child: Stack(
                                     children: [
                                       Center(
                                         child: Container(
                                           decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: Colors.white38,
                                           ),
                                         ),
                                       ),
                                       Center(
                                         child: Container(
                                           margin: EdgeInsets.all(6),
                                           decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: Color(0xFFCADCED),
                                           ),
                                           child: Icon(
                                             LineAwesomeIcons.plus,
                                             color: skyBlue,
                                           ),
                                         ),
                                       )
                                     ],
                                 ),
        backgroundColor: Color(0xFFCADCED),
      ),
     // backgroundColor: Color(0xFFCADCED),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(children: <Widget>[
              SizedBox(height: SizeConfig.heightMultiplier*4,),
               Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(LineAwesomeIcons.arrow_left),
                          onPressed: (){
                            Navigator.pop(context);
                          }),
                      Text(
                        'Stock-In',
                        style: kCaptionTextStyle,
                      ),
                      IconButton(
                          icon: Icon(LineAwesomeIcons.search), onPressed: null),
                    ],
                  ),
                   SizedBox(height: SizeConfig.heightMultiplier*4,),
              
              Flexible(
                child: ListView.builder(
                    itemCount: plo.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            decoration: BoxDecoration(
                                 boxShadow: neumorpShadow,
                                  color: dri2, borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: SizeConfig.heightMultiplier * 8,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle),
                                      child:  Icon(LineAwesomeIcons.mobile_phone),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    plo[index].title,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                      height: 20,
                                      child: Image.asset(
                                        'assets/images/in.png',
                                        color: skyBlue,
                                      ),
                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Column(
                                                    children: <Widget>[
                                                      Container(
                                                        height: SizeConfig
                                                                .heightMultiplier *
                                                            4,
                                                        width: SizeConfig
                                                                .widthMultiplier *
                                                            3,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .greenAccent,
                                                                shape: BoxShape
                                                                    .circle),
                                                      ),
                                                      Text(
                                                        'Color',
                                                        style: TextStyle(
                                                          //fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Text(
                                                        '5',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Qty-left',
                                                        style: TextStyle(
                                                          //fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Text(
                                                        'Feb-21',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Date-In',
                                                        style: TextStyle(
                                                          //fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Row(
                                                 crossAxisAlignment: CrossAxisAlignment.end,
                                                 mainAxisAlignment: MainAxisAlignment.end,
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
                                             ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Send amount
                        ],
                      );
                    }),
              )
            ])),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}