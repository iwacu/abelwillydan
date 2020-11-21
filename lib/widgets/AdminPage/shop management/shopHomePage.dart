import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/allShops.dart';

class ShopManagementHomePage extends StatefulWidget {
  final List<AllShop> allShops;

  const ShopManagementHomePage({Key key, this.allShops}) : super(key: key);
  @override
  _ShopManagementHomePageState createState() => _ShopManagementHomePageState();
}

class _ShopManagementHomePageState extends State<ShopManagementHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                   Text('All Shops',
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
         itemCount:widget.allShops.length,
        itemBuilder: (context,index){
        return  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
                 // height: SizeConfig.heightMultiplier *20,
                          
                   decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                     child: Column(
                       children: [
                                     Container(
                  // height: SizeConfig.heightMultiplier *20,
                          
                   decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                //FIRST_ROW
                                Padding(
                                  padding: const EdgeInsets.only(left:10,top: 15,right: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                       Text('Shop Number',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              ),),
                                               Padding(
                                                 padding: const EdgeInsets.only(right:8,left: 8),
                                                 child:Text('${widget.allShops[index].shopNumber}',style: TextStyle(
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
                           Text('Shop Name',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              ),),
                                               Padding(
                                                 padding: const EdgeInsets.only(right:8,left: 8),
                                                 child:Text('${widget.allShops[index].shopName}',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                          fontFamily: 'Montserrat',
                                              color: Colors.orangeAccent,
                                              ),)
                                               ),
                        ],),
                           SizedBox(height: SizeConfig.heightMultiplier*5,),
                                Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                           Text('Shop District',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              ),),
                                               Padding(
                                                 padding: const EdgeInsets.only(right:8,left: 8),
                                                 child:Text('${widget.allShops[index].shopDistrict}',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                          fontFamily: 'Montserrat',
                                              color: Colors.blueAccent,
                                              ),)
                                               ),
                        ],),
                           SizedBox(height: SizeConfig.heightMultiplier*5,),
                                Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                           Text('Shop Sector',style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              ),),
                                               Padding(
                                                 padding: const EdgeInsets.only(right:8,left: 8),
                                                 child:Text('${widget.allShops[index].shopSector}',style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                          fontFamily: 'Montserrat',
                                              color: Colors.lightGreenAccent,
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