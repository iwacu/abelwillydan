import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/constant/textsyle.dart';
import 'package:phonestockmgt/models/allPositions.dart';
import 'package:phonestockmgt/models/allShops.dart';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/API/apiresponsehandl.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneBrand.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneBrandType.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneColor.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneSpecifications.dart';
import 'package:phonestockmgt/widgets/AdminPage/phoneManagement/addPhoneStorage.dart';
import 'package:phonestockmgt/widgets/AdminPage/position%20Manaement/positionHomepage.dart';
import 'package:phonestockmgt/widgets/AdminPage/shop%20management/addShop.dart';
import 'package:phonestockmgt/widgets/AdminPage/shop%20management/oldShopManagement.dart';
import 'package:phonestockmgt/widgets/AdminPage/shop%20management/shopAssignment.dart';
import 'package:phonestockmgt/widgets/AdminPage/shop%20management/shopHomePage.dart';
import 'package:phonestockmgt/widgets/AdminPage/user%20Management/UserManagementHomepage.dart';
import 'package:phonestockmgt/widgets/AdminPage/user%20Management/olderPositionManagement.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';

class StoreManagement extends StatefulWidget {
  final String token;
   final List<AllPositions> allPositions;
  final List<AllShop> allShops;
  final UserDetails user;
  const StoreManagement({Key key, this.token, this.allPositions, this.allShops, this.user}) : super(key: key);
  @override
  _StoreManagementState createState() => _StoreManagementState();
}

class _StoreManagementState extends State<StoreManagement>with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin  {
  ApiResponse get service => GetIt.I<ApiResponse>();
  final scaffoldState = GlobalKey<ScaffoldState>();
  APIResponse<List<Person>, List<AllShopss>, List<AssingedShop>> _apiResponse;
   TabController tabController;

  bool _isLoading = false;
   @override
  void initState() {
    _fetchApi();
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  _fetchApi() async {
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await service.userManagement(token: widget.token);

    setState(() {
      _isLoading = false;
    });
  }
 
  @override
  Widget build(BuildContext context) {
     super.build(context);
    return Scaffold(
        //backgroundColor: Color(0xFFCADCED),
        body: Builder(builder: (_) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(LineAwesomeIcons.arrow_left),
                          onPressed: (){
                            Navigator.pop(context);
                          }),
                      Text(
                        'Store Management',
                        style: kCaptionTextStyle,
                      ),
                      IconButton(
                          icon: Icon(LineAwesomeIcons.bell_1), onPressed: null),
                    ],
                  ),
                  CarouselSlider(
                    items: [
                     _sliderAppBar('Position Management', LineAwesomeIcons.map_pin, 
                    _apiResponse.data.where((element) => element.positionName != null).toList().length.toString(),
                      _apiResponse.data.where((element) => element.positionName == null).toList().length.toString(), 
                      _apiResponse.data.length.toString()),
                       _sliderAppBar('Shop Management', LineAwesomeIcons.damaged_house, 
                   _apiResponse.shopAssinged.where((element) => element.shopname != null).toList().length.toString(),
                     _apiResponse.shopAssinged.where((element) => element.shopname == null).toList().length.toString(), 
                      _apiResponse.shopAssinged.length.toString()),
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
                  'Position Management',
                    ),
                  ),
                  Tab(
                    child: Text(
                  'Shop Management',
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
                    _positionManagement(),
                    _shopManagement(),
                    _phoneManagement(),
                  ]),
              ),
     
                ],
              ),
            ),
          );
        }));
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
   _positionManagement() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 3,
          ),
          Text('Position Management',
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
                            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PositionManagementHomePage(
                              allPositions:widget.allPositions),
                      ));
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
                            LineAwesomeIcons.list_ol,
                            color: skyBlue,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('List All Positions',
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
                            builder: (context) => UserManagementHomePage(
                                  allUsers: _apiResponse.data,
                                  allPositions: widget.allPositions,
                                  user: widget.user,
                                  token: widget.token,

                                )),
                      ).then((_) {
                        _fetchApi();
                      });
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
                            LineAwesomeIcons.map_pin,
                            color: orange,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('Assign Position To Users',
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
                            builder: (context) => OlderPositionManagement(
                                  allUsers: _apiResponse.data,
                                  allPositions: widget.allPositions,
                                  user: widget.user,
                                  token: widget.token,
                                )),
                      ).then((_) {
                        _fetchApi();
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.pen,
                          color: Colors.black38,
                        ),
                        Text('Edit User Position',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _shopManagement() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 3,
          ),
          Text('Store Management',
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
                                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShopManagementHomePage(
                                  allShops: _apiResponse.shops,
                                  token: widget.token,
                                )),
                      ).then((_) {
                        _fetchApi();
                      });
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
                            LineAwesomeIcons.list_ol,
                            color: skyBlue,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('List All Shops',
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
                            builder: (context) => ShopAssignment(
                                  allUsers: _apiResponse.shopAssinged,
                                  allPositions: _apiResponse.shops,
                                  user: widget.user,
                                  token: widget.token,
                                )),
                      ).then((_) {
                        _fetchApi();
                      });
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
                            LineAwesomeIcons.map_pin,
                            color: orange,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('Assign Shop To Users',
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
                            builder: (context) => OldShopAssignment(
                                  allUsers: _apiResponse.shopAssinged,
                                  allPositions: _apiResponse.shops,
                                  user: widget.user,
                                  token: widget.token,
                                )),
                      ).then((_) {
                        _fetchApi();
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.pen,
                          color: Colors.black38,
                        ),
                        Text('Edit User Shop ',
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
                            builder: (context) => AddingShop(
                                  token: widget.token,
                                )),
                      );
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
                        Text('Add Shop ',
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
                                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShopManagementHomePage(
                                  allShops: _apiResponse.shops,
                                  token: widget.token,
                                )),
                      ).then((_) {
                        _fetchApi();
                      });
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
                            LineAwesomeIcons.list_ol,
                            color: skyBlue,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3,
                        ),
                        Text('List of Phone',
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
                                //AddPhoneBrand
                                 Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPhoneBrand(
                                  token: widget.token,
                                )),
                      ).then((_) {
                        _fetchApi();
                      });
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
                            builder: (context) => AddPhoneBrandType(
                                  token: widget.token,
                                )),
                      ).then((_) {
                        _fetchApi();
                      });
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
                        Text('Add Phone Brand Type',
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
                                )),
                      ).then((_) {
                        _fetchApi();
                      });
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
                      ).then((_) {
                        _fetchApi();
                      });
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
                      ).then((_) {
                        _fetchApi();
                      });
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

 
  
  @override
  bool get wantKeepAlive => true;
}
