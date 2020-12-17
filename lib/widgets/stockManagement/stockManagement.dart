import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/stockManagementresponse.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/API/apiresponsehandl.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneBrand.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneBrandType.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneColor.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneSpecifications.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneStorage.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';
import 'package:phonestockmgt/widgets/stockManagement/stockIn/addStock.dart';


class StockManagement extends StatefulWidget {
   final String token;
    final UserDetails user;
  const StockManagement({Key key, this.token, this.user}) : super(key: key);
  @override
  _StockManagementState createState() => _StockManagementState();
}

class _StockManagementState extends State<StockManagement> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
   ApiResponse get service => GetIt.I<ApiResponse>();
   TabController tabController;
  bool _isLoading=false;
  APIStockMgtResponse<List<AllBrands>,List<PhoneModel>,List<AllColors>,List<AllStorage>> _apiResponse;
   @override
  void initState() {
     _fetchApi();
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
   _fetchApi() async {
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await service.stockMgt(token: widget.token);

    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
      super.build(context);
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        
        actions: [
              
               IconButton(
                   icon: Icon(LineAwesomeIcons.bell_1), onPressed: ()async{
                     print(widget.user.id);
                     }),
                  
             
        ],
      ),
    
      body:  Builder(
        builder: (_)  {
          if (_isLoading) {
            return Loading();
          }

          if (_apiResponse.error) {
            return Center(child: Text(_apiResponse.errorMessage));
          }

          return SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView(
                    children: [
                            CarouselSlider(
                        items: [
                         _sliderAppBar('Stock Overview',LineAwesomeIcons.shopping_cart_arrow_down,'12','34','21'),
                         _sliderAppBar('Sales Overview',LineAwesomeIcons.money_bill,'12','34','21'),
                    
                    
                       ],
                        options: CarouselOptions(
                            height: SizeConfig.heightMultiplier * 25,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 18 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            enableInfiniteScroll: true,
                            viewportFraction: 0.8),
                      ),
                
                         SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  TabBar(
                    controller: tabController,
                    indicatorColor: Color(0xFFCADCED),
                  indicatorWeight: 3.0,
                  labelColor: Colors.black,
                  unselectedLabelColor: Color(0xFFCADCED),
                  isScrollable: true,
                    tabs: [
                      Tab(
                        child: Text(
                      'Stock Management',
                        ),
                      ),
                     
                      Tab(
                        child:  Text(
                      'Phone Management',
                        ),
                      )
                    ]),
                  SizedBox(
                    height: SizeConfig.heightMultiplier*70,
                                  child: TabBarView(controller: tabController, children: [
                        _stockManagement(),
                        _phoneManagement(),
                      ]),
                  ),
     
                    ],
                  ),
                ),
              );
        }
      ),
    
    );
  }
  _stockManagement() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 3,
          ),
          Text('Stock Management',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: Colors.black38,
              )),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
              margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 4)
                  .copyWith(bottom: SizeConfig.heightMultiplier * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: neumorpShadow,
                color: Color(0xFFCADCED),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4,
                  vertical: SizeConfig.heightMultiplier * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      //           Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ShopManagementHomePage(
                      //             allShops: _apiResponse.shops,
                      //             token: widget.token,
                      //           )),
                      // ).then((_) {
                      //   _fetchApi();
                      // });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: neumorpShadow,
                            color: Color(0xFFCADCED),
                          ),
                          child: Icon(
                            LineAwesomeIcons.eye,
                            color: skyBlue,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('View Stock',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Spacer(),
                        Icon(
                          LineAwesomeIcons.angle_right,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  GestureDetector(
                    onTap: () {
                              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddStock(
                      token: widget.token,
                      allPhoneModels:  _apiResponse.phoneModel,
                      allColors: _apiResponse.colors,
                      allStorage: _apiResponse.storages,
                                )),
                      );
                      //.then((_) {
                      //   _fetchApi();
                      // });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: neumorpShadow,
                            color: Color(0xFFCADCED),
                          ),
                          child: Icon(
                            LineAwesomeIcons.plus,
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('Add Stock',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Spacer(),
                        Icon(
                          LineAwesomeIcons.angle_right,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      //         Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => OldShopAssignment(
                      //             allUsers: _apiResponse.shopAssinged,
                      //             allPositions: _apiResponse.shops,
                      //             user: widget.user,
                      //             token: widget.token,
                      //           )),
                      // ).then((_) {
                      //   _fetchApi();
                      // });
                    },
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.minus,
                          color: orange,
                        ),
                        Text('Stock Out',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Spacer(),
                        Icon(
                          LineAwesomeIcons.angle_right,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                     GestureDetector(
                    onTap: () {
                      //         Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => OldShopAssignment(
                      //             allUsers: _apiResponse.shopAssinged,
                      //             allPositions: _apiResponse.shops,
                      //             user: widget.user,
                      //             token: widget.token,
                      //           )),
                      // ).then((_) {
                      //   _fetchApi();
                      // });
                    },
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.money_bill,
                          color: Colors.green,
                        ),
                        Text('View Sales',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Spacer(),
                        Icon(
                          LineAwesomeIcons.angle_right,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
               
                  GestureDetector(
                    onTap: () {
                      //             Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => AddingShop(
                      //             token: widget.token,
                      //           )),
                      // );
                    },
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: neumorpShadow,
                            color: Color(0xFFCADCED),
                          ),
                          child: Icon(
                            LineAwesomeIcons.alternate_sort_amount_down,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('Lower Stock',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Spacer(),
                        Icon(
                          LineAwesomeIcons.angle_right,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

 
   _phoneManagement() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 3,
          ),
          Text('Phone Management',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: Colors.black38,
              )),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
              margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 4)
                  .copyWith(bottom: SizeConfig.heightMultiplier * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: neumorpShadow,
                color: Color(0xFFCADCED),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4,
                  vertical: SizeConfig.heightMultiplier * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              GestureDetector(
                    onTap: () {
                              //  AddPhoneBrand
                                 Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPhoneBrand(
                                  token: widget.token,
                                )),
                      );
                      //.then((_) {
                      //   _fetchApi();
                      // });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: neumorpShadow,
                            color: Color(0xFFCADCED),
                          ),
                          child: Icon(
                            LineAwesomeIcons.plus,
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('Add Phone Brand ',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Spacer(),
                        Icon(
                          LineAwesomeIcons.angle_right,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  GestureDetector(
                    onTap: () {
                                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPhoneBrandTypeSpecifications(
                                 token: widget.token,
                                 allBrands: _apiResponse.brands,
                                 allColors: _apiResponse.colors,
                                 allStorages: _apiResponse.storages,
                                )),
                      );
                      //.then((_) {
                      //   _fetchApi();
                      // });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: neumorpShadow,
                            color: Color(0xFFCADCED),
                          ),
                          child: Icon(LineAwesomeIcons.plus, color: skyBlue),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('Add specifications',
                            //  overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Spacer(),
                        Icon(
                          LineAwesomeIcons.angle_right,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  GestureDetector(
                    onTap: () {
                                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPhoneColors(
                                 token: widget.token,
                                )),
                      );
                      //.then((_) {
                      //   _fetchApi();
                      // });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: neumorpShadow,
                            color: Color(0xFFCADCED),
                          ),
                          child: Icon(LineAwesomeIcons.plus, color: skyBlue),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('Add Phone Color',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Spacer(),
                        Icon(
                          LineAwesomeIcons.angle_right,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  GestureDetector(
                    onTap: () {
                                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPhoneStorages(
                                  token: widget.token,
                                )),
                      );
                      //.then((_) {
                      //   _fetchApi();
                      // });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: neumorpShadow,
                            color: Color(0xFFCADCED),
                          ),
                          child: Icon(LineAwesomeIcons.plus, color: skyBlue),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('Add Phone Storage',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black38,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                        Spacer(),
                        Icon(
                          LineAwesomeIcons.angle_right,
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
 _sliderAppBar(String name, IconData icon,String assigned,String unAssigned,String users) {
    return     Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            boxShadow: neumorpShadow,
                            color: Color(0xFFCADCED),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              top: SizeConfig.heightMultiplier * 6,
                              bottom: -SizeConfig.heightMultiplier * 6,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: neumorpShadow,
                                    shape: BoxShape.circle,
                                    color: Colors.white38),
                              ),
                            ),
                            Positioned.fill(
                              top: -SizeConfig.heightMultiplier * 15,
                              left: -SizeConfig.heightMultiplier * 19,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: neumorpShadow,
                                    shape: BoxShape.circle,
                                    color: Colors.white38),
                              ),
                            ),
                            Positioned.fill(
                              top: SizeConfig.heightMultiplier * 3,
                              left: SizeConfig.widthMultiplier * 3,
                              bottom: SizeConfig.heightMultiplier*3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(icon),
                                      SizedBox(
                                          width:
                                              SizeConfig.widthMultiplier * 2),
                                      Text(name,
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      2.6,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black38)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            assigned,
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        1.9,
                                                fontFamily: 'Montserrat',
                                                fontWeight:FontWeight.bold,
                                                color: Colors.black38),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    4,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        3,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors
                                                        .lightGreenAccent),
                                              ),
                                              SizedBox(
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        1.2,
                                              ),
                                              Text(
                                                'Assigned',
                                                style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        1.9,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black38),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        color: Colors.white,
                                        width: 0.2,
                                        height: SizeConfig.heightMultiplier * 5,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            unAssigned,
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        1.9,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black38),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    4,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        3,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.redAccent),
                                              ),
                                              SizedBox(
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        1.2,
                                              ),
                                              Text(
                                                'Unassigned',
                                                style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        1.9,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black38),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                   Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Total Users ',
                                    style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        1.9,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black38),
                                  ),
                                  Text(
                                    users,
                                    style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        1.9,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black38),
                                  ),
                                ],
                              ),
                              
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                   
  }
  
 
   @override
  bool get wantKeepAlive => true;
}



