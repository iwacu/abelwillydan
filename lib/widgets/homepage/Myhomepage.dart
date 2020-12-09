import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/constant/textsyle.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/Database/database.dart';
import 'package:phonestockmgt/widgets/AdminPage/storeManagment.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: StreamBuilder(
         stream: DatabaseClient().item().asStream(),
    builder: (context, AsyncSnapshot<UserDetails>snapshot) {
          return snapshot.data==null?Loading():Stack(
            children: [
              Container(
                  height: SizeConfig.heightMultiplier * 59,
                  decoration: BoxDecoration(
                    boxShadow: neumorpShadow,
                    color: backgroundColor,
                  )),
                   SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier*8,
                    ),
                 Container(
                      height: SizeConfig.heightMultiplier*24,
                 width: double.infinity,
                 padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                 decoration: BoxDecoration(
                   color:Colors.white38,
                   borderRadius: BorderRadius.all(Radius.circular(20)),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Text('Hello',style: kSmallTextStyle,),
                         SizedBox(width:SizeConfig.widthMultiplier *2.5),
                                            Text('${snapshot.data.firstname}',style:kSmallTitleTextStyle),
                                            Spacer(),
                   GestureDetector(
                               onTap: () async {
                                 
                               },
                               child: Container(
                                 height: 50,
                                 width: 50,
                                 decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                     boxShadow: neumorpShadow,
                                     color: Color(0xFFCADCED),
                                 ),
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
                                             LineAwesomeIcons.bell_1,
                                             color: skyBlue,
                                           ),
                                         ),
                                       )
                                     ],
                                 ),
                               ),
                             ),
                       ],
                     ),
                   Spacer(),
                    Row(
                      children: [
                        Text('Welcome Back',style:kSmallTitleTextStyle),
                        SizedBox(width: SizeConfig.widthMultiplier*3),
                        Icon(LineAwesomeIcons.thumbs_up_1,color: skyBlue,),
                      ],
                    ),
                   Spacer(),
                    Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '${snapshot.data.positionName}',
                                                  style:kSmallTitleTextStyle
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          4,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        boxShadow: neumorpShadow,
                                                        color: backgroundColor,
                                                      ),
                                                      child: Icon(
                                                        LineAwesomeIcons
                                                            .crosshairs,
                                                        color: skyBlue,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          1.2,
                                                    ),
                                                    Text(
                                                      'My Position',
                                                      style: kSmallTextStyle,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              color: Colors.white,
                                              width: 0.2,
                                              height:
                                                  SizeConfig.heightMultiplier * 5,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  'Kanombe',
                                                  style: kSmallTitleTextStyle
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          4,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        boxShadow: neumorpShadow,
                                                        color: backgroundColor,
                                                      ),
                                                      child: Icon(
                                                        LineAwesomeIcons.map_pin,
                                                        color: skyBlue,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          1.2,
                                                    ),
                                                    Text(
                                                      'My Shop',
                                                      style: kSmallTextStyle,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                   ],
                 ),
                    Spacer()
                   ]),
                 ),
                 SizedBox(height: SizeConfig.heightMultiplier*3,),
                Text('Categories',style:kSmallTitleTextStyle),
                 SizedBox(height: SizeConfig.heightMultiplier*3,),
                 Expanded(
                                    child: GridView.count(
                                      childAspectRatio: .85,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                     crossAxisCount: 2,
                     children: <Widget>[
                       CategoryCard(name:'Search Item',image:'assets/images/search.png',),
                       CategoryCard(name:'Contact',image:'assets/images/contact.png',),
                       CategoryCard(name:'Add Stock',image: 'assets/images/addStock.png',),
                       CategoryCard(name:'View Stock',image: 'assets/images/stockIn.png',),
                        CategoryCard(name:'Stock Out ',image: 'assets/images/stockOut.jpg',),
                       CategoryCard(name:'Sales',image: 'assets/images/viewSales.png',),
                      GestureDetector(
                        onTap: (){
                           Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StoreManagement(
                               token: snapshot.data.token,
                              )),
                    );
                        },
                        child: CategoryCard(name:'Store Mangement',image: 'assets/images/storeMnagement.png',)),
                     ],),
                 )
                 
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

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;
  const CategoryCard({
    Key key, this.name, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13)
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Image.asset(image,height: SizeConfig.heightMultiplier*12,),
          Spacer(), 
          Text(name,textAlign: TextAlign.center,style:kSmallTitleTextStyle,),
        ],
      ),
    );
  }
}
