import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/constant/textsyle.dart';
import 'package:phonestockmgt/models/allPositions.dart';
import 'package:phonestockmgt/models/allShops.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/Database/database.dart';
import 'package:phonestockmgt/widgets/AdminPage/storeManagment.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';
import 'package:phonestockmgt/widgets/stockManagement/stockManagement.dart';
import 'package:provider/provider.dart';

class HomePageTesting extends StatefulWidget {
  @override
  _HomePageTestingState createState() => _HomePageTestingState();
}

class _HomePageTestingState extends State<HomePageTesting>with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
     final _allPositions=Provider.of<List<AllPositions>>(context);
     final _allShops=Provider.of<List<AllShop>>(context);
   
    return Scaffold(
      backgroundColor: Color(0xffe5edfe),
      body: StreamBuilder(
        stream: DatabaseClient().item().asStream(),
            builder: (context, AsyncSnapshot<UserDetails> snapshot) {
              return snapshot.data == null
                  ? Loading()
                  :ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFCADCED),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                               Padding(
                                 padding: EdgeInsets.only(
                                   top:37,
                                   left:15,
                                   right: 15 ),
                                 child: Row(
                                   children: [
                                     Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                               //   shape: BoxShape.circle,
                                                  boxShadow: neumorpShadow,
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color(0xFFCADCED),
                                                ),
                                                child: Icon(
                                                          LineAwesomeIcons.user_1,
                                                          color: skyBlue,
                                                          size: 5 * SizeConfig.imageSizeMultiplier,
                                                        )
                                              ),
                                    SizedBox(width: 3*SizeConfig.widthMultiplier),
                                    Text('Hello, ${snapshot.data.firstname} !',style:TextStyle(
                                      color: Colors.white,
                                      fontSize: 2.3 * SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                    Spacer(),
                                      Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                               //   shape: BoxShape.circle,
                                                  boxShadow: neumorpShadow,
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color(0xFFCADCED),
                                                ),
                                                child: Icon(
                                                          LineAwesomeIcons.bell_1,
                                                          color: skyBlue,
                                                          size: 5 * SizeConfig.imageSizeMultiplier,
                                                        )
                                              ),
                                   
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding:EdgeInsets.only(
                                   top:17,
                                   left:15,
                                   ),
                                 child: Text('Welcome Back',style: TextStyle(
                                   fontSize: 3.5 * SizeConfig.textMultiplier,
                                   color: Colors.white,
                                   letterSpacing: 0.5,
                                   fontWeight: FontWeight.w700,
                                 ),),
                               ),
                              Padding(
                                padding:EdgeInsets.symmetric(vertical:18.0,horizontal: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                                                  child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical:13.0,horizontal: 14.0),
                                          child: Row(
                                            children: [
                                              Icon(LineAwesomeIcons.search,color: skyBlue,size: 5*SizeConfig.imageSizeMultiplier,),
                                              SizedBox(width: 2*SizeConfig.widthMultiplier),
                                              Expanded(
                                                                                  child: TextFormField(
                                                  keyboardType: TextInputType.text,
                                                  cursorColor: skyBlue,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 1.6*SizeConfig.textMultiplier,
                                                  ),
                                                  decoration: InputDecoration.collapsed(
                                                    hintText: 'Search any item here',
                                                    hintStyle: TextStyle(
                                                      fontSize: 1.7 *SizeConfig.textMultiplier,
                                                      color: Colors.black38
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3*SizeConfig.widthMultiplier,),
                                        Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                               //   shape: BoxShape.circle,
                                                  boxShadow: neumorpShadow,
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color(0xFFCADCED),
                                                ),
                                                child: Icon(
                                                          LineAwesomeIcons.barcode,
                                                          color: skyBlue,
                                                          size: 5 * SizeConfig.imageSizeMultiplier,
                                                        )
                                              ),
                                 
                                  ],
                                ),
                              ),
                               
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier*3,),
                Padding(
                  padding:EdgeInsets.only(left:18.0,right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dashboard',style: TextStyle(
                        color: Colors.black,
                        fontSize: 2.2* SizeConfig.textMultiplier,
                        fontWeight: FontWeight.w600,
                      ),),
                       Text('(Categories)',style: TextStyle(
                        color: Colors.black38,
                        fontSize: 1.8* SizeConfig.textMultiplier,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier*3),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8
                  ),
                  child: GridView.count(
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                       crossAxisCount: 2,
                       children: <Widget>[
                         CategoryCard(name:'Search Item',image:'assets/images/search.png',),
                         CategoryCard(name:'Contact',image:'assets/images/contact.png',),
                         GestureDetector(
                           onTap: (){
                             print(snapshot.data.id);
                             Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StockManagement(
                              token: snapshot.data.token,user: snapshot.data,
                                )),
                      );
                           },
                           child: CategoryCard(name:'Stock Management',image:'assets/images/stock.png',)),
                       GestureDetector(
                          onTap: (){
                             Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoreManagement(
                                 token: snapshot.data.token,
                                 allPositions: _allPositions,
                                 allShops: _allShops,
                                 user: snapshot.data,
                                )),
                      );
                          },
                          child: CategoryCard(name:'Store Mangement',image: 'assets/images/storeMnagement.png',)),
                       ],),
                )
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
          Image.asset(image,height: SizeConfig.heightMultiplier*8,),
          Spacer(), 
          Text(name,textAlign: TextAlign.center,style:kSmallTitleTextStyle,),
        ],
      ),
    );
  }
}
