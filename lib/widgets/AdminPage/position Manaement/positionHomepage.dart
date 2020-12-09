import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/allPositions.dart';

class PositionManagementHomePage extends StatefulWidget {
  final List<AllPositions> allPositions;

  const PositionManagementHomePage({Key key, this.allPositions}) : super(key: key);
  @override
  _PositionManagementHomePageState createState() => _PositionManagementHomePageState();
}

class _PositionManagementHomePageState extends State<PositionManagementHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor:Color(0xFFCADCED),
      body: Column(
        children: [
              SizedBox(
            height: SizeConfig.heightMultiplier * 6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(LineAwesomeIcons.arrow_left),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                   Text('All Positions',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: SizeConfig.textMultiplier * 2.4)),
                IconButton(
                    icon: Icon(LineAwesomeIcons.search),
                    onPressed: null)
              ],
            ),
          ),
        Expanded(child: ListView.builder(
         itemCount:widget.allPositions.length,
        itemBuilder: (context,index){
        return  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
                  height: SizeConfig.heightMultiplier *17,
                          
                    child: Column(
                       children: [
                                     Container(
                   height: SizeConfig.heightMultiplier *17,
                          
                   decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              boxShadow: neumorpShadow,
                              color: Colors.white38,
                            ),
                            child: Column(
                              children: <Widget>[
                                //FIRST_ROW
                                Padding(
                                  padding: const EdgeInsets.only(left:10,top: 15,right: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                       Text('Position Code',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              ),),
                                               Padding(
                                                 padding: const EdgeInsets.only(right:8,left: 8),
                                                 child:Text('${widget.allPositions[index].positionCode}',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                          fontFamily: 'Montserrat',
                                              color: Colors.green,
                                              ),)
                                               ), Spacer(),
                                       Padding(
                                         padding: const EdgeInsets.only(left:7),
                                         child: GestureDetector(
                                           onTap: null ,
                                                                     child: Container(
                                              height: SizeConfig.heightMultiplier*3,
                                              width: SizeConfig.widthMultiplier*12,
                              decoration: BoxDecoration(
                                 border: Border.all(color: Colors.black),
                                 borderRadius: BorderRadius.all(Radius.circular(15.0))
                              ),
                             
                                             child: Center(child: Text('Edit',style:TextStyle(fontSize: SizeConfig.textMultiplier* 1.8)))),
                                         ),
                                       ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: SizeConfig.heightMultiplier*5,),
                                Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                           Text('Position Name',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              ),),
                                               Padding(
                                                 padding: const EdgeInsets.only(right:8,left: 8),
                                                 child:Text('${widget.allPositions[index].positionName}',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                          fontFamily: 'Montserrat',
                                              color: Colors.orangeAccent,
                                              ),)
                                               ),
                        ],),
                      
                              ],
                            ),
                 ),
           
                       ],
                     ),
              ),
        );
      
      })
      )
      
      
        ],
      ),
    );
  }
}