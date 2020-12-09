import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/widgets/AdminPage/shop%20management/editShop.dart';

class ShopManagementHomePage extends StatefulWidget {
  final List<AllShopss> allShops;
  final String token;
  const ShopManagementHomePage({Key key, this.allShops, this.token})
      : super(key: key);
  @override
  _ShopManagementHomePageState createState() => _ShopManagementHomePageState();
}

class _ShopManagementHomePageState extends State<ShopManagementHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //  backgroundColor: Color(0xFFCADCED),
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
                    icon: Icon(LineAwesomeIcons.search), onPressed: () {})
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: widget.allShops.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal:4,vertical:8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                               boxShadow: neumorpShadow,
                              color: Colors.white38,
                            ),
                              child: Column(
                                children: <Widget>[
                                  //FIRST_ROW
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 15, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Shop Number',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8, left: 8),
                                            child: Text(
                                              '${widget.allShops[index].fields.shopCode}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                                                color: Colors.green,
                                              ),
                                            )),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditShop(
                                                          shop: widget
                                                              .allShops[index],
                                                          token: widget.token,
                                                        )),
                                              );
                                            },
                                            child: 
                                                      Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:8,
                                                vertical:8
                                              ),
                                height: SizeConfig.heightMultiplier*5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: neumorpShadow,
                                    color: Color(0xFFCADCED),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(LineAwesomeIcons.edit_1,color: Colors.black45,size: 5*SizeConfig.imageSizeMultiplier,),
                                      Text(
                                              'Edit',
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                                                color: Colors.black38,
                                              ),
                                            ),
                                    ],
                                  ),
                              ),
                                 ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 3,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'Shop Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8, left: 8),
                                          child: Text(
                                            '${widget.allShops[index].fields.shopName}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat',
                                              color: Colors.orangeAccent,
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Shop District',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8, left: 8),
                                          child: Text(
                                            '${widget.allShops[index].fields.shopDistrict}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat',
                                              color: Colors.blueAccent,
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'Shop Sector',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8, left: 8),
                                          child: Text(
                                            '${widget.allShops[index].fields.shopSector}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat',
                                              color: Colors.black38,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
