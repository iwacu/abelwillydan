import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/allPositions.dart';
import 'package:phonestockmgt/models/allShops.dart';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/API/apiresponsehandl.dart';
import 'package:phonestockmgt/widgets/AdminPage/position%20Manaement/positionHomepage.dart';
import 'package:phonestockmgt/widgets/AdminPage/shop%20management/shopAssignment.dart';
import 'package:phonestockmgt/widgets/AdminPage/shop%20management/shopHomePage.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';
import 'user Management/UserManagementHomepage.dart';

class AdminDashboard extends StatefulWidget {
  final String token;
  final List<AllPositions> allPositions;
  final List<AllShop> allShops;
  final UserDetails user;
  const AdminDashboard(
      {Key key, this.token, this.allPositions, this.allShops, this.user})
      : super(key: key);
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  ApiResponse get service => GetIt.I<ApiResponse>();

  APIResponse<List<Person>, List<AllShopss>,List<AssingedShop>> _apiResponse;
  bool _isLoading = false;
  @override
  void initState() {
    _fetchApi();
    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(LineAwesomeIcons.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Admin Menu',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: SizeConfig.textMultiplier * 2.4)),
        actions: [
          IconButton(
              icon: Icon(LineAwesomeIcons.bell),
              onPressed: () async {
                print(widget.allPositions.length.toString());
                print(widget.allShops.length.toString());
              })
        ],
      ),
      body: Builder(builder: (_) {
        if (_isLoading) {
          return Loading();
        }

        if (_apiResponse.error) {
          return Center(child: Text(_apiResponse.errorMessage));
        }
        return Column(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Expanded(
                child: ListView(
              children: [
                //Position Assignemnt
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 3),
                  child: Row(
                    children: [
                        Icon(LineAwesomeIcons.location_arrow),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 3),
                                child: Text('Position Assignment',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2.2)),
                              ),
                     
                    ],
                  ),
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
                  child: Container(
                    height: SizeConfig.heightMultiplier * 20,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        //FIRST_ROW
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text('Total Users: ',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2)),
                                  Text('${_apiResponse.data.length.toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height: SizeConfig.heightMultiplier * 3,
                                      width: SizeConfig.widthMultiplier * 12,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      child: Center(
                                          child: Text('View',
                                              style: TextStyle(
                                                  fontSize: SizeConfig
                                                          .textMultiplier *
                                                      1.8)))),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(top: 28, left: 8, right: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${_apiResponse.data.where((element) => element.positionName != null).toList().length.toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2.1),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: SizeConfig.heightMultiplier * 4,
                                        width: SizeConfig.widthMultiplier * 3,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreenAccent,
                                            shape: BoxShape.circle),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text("Assigned Users",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        2.1)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.black,
                                width: 0.2,
                                height: SizeConfig.heightMultiplier * 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                      "${_apiResponse.data.where((element) => element.positionName == null).toList().length.toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.1)),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: SizeConfig.heightMultiplier * 4,
                                        width: SizeConfig.widthMultiplier * 3,
                                        decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            shape: BoxShape.circle),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text("Unassigned Users",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        2.1)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                ),
                //Shop Assignemnt
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 3),
                  child: Row(
                    children: [
                        Icon(LineAwesomeIcons.shopping_bag),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 3),
                                child: Text('Shop Assignment',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2.2)),
                              ),
                     
                    ],
                  ),
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
                  child: Container(
                    height: SizeConfig.heightMultiplier * 20,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        //FIRST_ROW
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text('Total Users: ',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2)),
                                  Text('${_apiResponse.shopAssinged.length.toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.2)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height: SizeConfig.heightMultiplier * 3,
                                      width: SizeConfig.widthMultiplier * 12,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      child: Center(
                                          child: Text('View',
                                              style: TextStyle(
                                                  fontSize: SizeConfig
                                                          .textMultiplier *
                                                      1.8)))),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(top: 28, left: 8, right: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${_apiResponse.shopAssinged.where((element) => element.shopname != null).toList().length.toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2.1),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: SizeConfig.heightMultiplier * 4,
                                        width: SizeConfig.widthMultiplier * 3,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreenAccent,
                                            shape: BoxShape.circle),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text("Assigned Users",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        2.1)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.black,
                                width: 0.2,
                                height: SizeConfig.heightMultiplier * 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                      "${_apiResponse.shopAssinged.where((element) => element.shopname == null).toList().length.toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2.1)),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: SizeConfig.heightMultiplier * 4,
                                        width: SizeConfig.widthMultiplier * 3,
                                        decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            shape: BoxShape.circle),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text("Unassigned Users",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        2.1)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PositionManagementHomePage(
                              allPositions: widget.allPositions)),
                    );
                  },
                  child: Container(
                    height: SizeConfig.heightMultiplier * 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        //FIRST_ROW
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(LineAwesomeIcons.location_arrow),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 3),
                                child: Text('Position ',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2.2)),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Row(
                                  children: [
                                    Text('Position Management',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.2)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 28, left: 14, right: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${widget.allPositions.length.toString()}",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          SizeConfig.textMultiplier * 5.1)),
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Text('Positions',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.9)),
                              ),
                              Spacer(),
                              Container(
                                  height: SizeConfig.heightMultiplier * 3,
                                  width: SizeConfig.widthMultiplier * 12,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  child: Center(
                                      child: Text('View',
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      1.8)))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShopManagementHomePage(
                              allShops: _apiResponse.shops,
                              token: widget.token,
                            )),
                  ).then((_) {
                    _fetchApi();
                  }),
                  child: Container(
                    height: SizeConfig.heightMultiplier * 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        //FIRST_ROW
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(LineAwesomeIcons.shopping_bag),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 3),
                                child: Text('Shops ',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2.2)),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Row(
                                  children: [
                                    Text('Shops Management',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.2)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 28, left: 14, right: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${_apiResponse.shops.length.toString()}",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          SizeConfig.textMultiplier * 5.1)),
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Text('Shops',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.9)),
                              ),
                              Spacer(),
                              Container(
                                  height: SizeConfig.heightMultiplier * 3,
                                  width: SizeConfig.widthMultiplier * 12,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  child: Center(
                                      child: Text('View',
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      1.8)))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 3),
                  child: Text('Brand Management',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.textMultiplier * 2.2)),
                ),
                Container(
                  height: SizeConfig.heightMultiplier * 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 15, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 3),
                              child: Text('Brand Item',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          SizeConfig.textMultiplier * 2.2)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Container(
                                  height: SizeConfig.heightMultiplier * 3,
                                  width: SizeConfig.widthMultiplier * 12,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  child: Center(
                                      child: Text('Add',
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      1.8)))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 28, left: 14, right: 14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("2",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.textMultiplier * 5.1)),
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Text('Brands',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize:
                                          SizeConfig.textMultiplier * 1.9)),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text('Iphone ,',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.9)),
                                Text('Samsung ,',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.9)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ],
        );
      }),
    );
  }
}
