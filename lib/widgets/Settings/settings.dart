import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/allPositions.dart';
import 'package:phonestockmgt/models/allShops.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/services/Authentication/wrapper.dart';
import 'package:phonestockmgt/services/Database/database.dart';
import 'package:phonestockmgt/widgets/AdminPage/adminDashboard.dart';
import 'package:phonestockmgt/widgets/Settings/myprofile/myprofile.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
     final _allPositions=Provider.of<List<AllPositions>>(context);
     final _allShops=Provider.of<List<AllShop>>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: StreamBuilder(
        stream: DatabaseClient().item().asStream(),
        builder: (context,AsyncSnapshot<UserDetails>snapshot){
      return snapshot.data==null?CircularProgressIndicator(): Column(
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 8,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 6),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 64.0,
                          backgroundImage:
                              AssetImage('assets/images/no_image.png'),
                        ),
                      ),
                      Positioned(
                        top: 74,
                        left: 94,
                        child: Container(
                            height: SizeConfig.heightMultiplier * 6,
                            // width: SizeConfig.widthMultiplier*2.5,
                            decoration: BoxDecoration(
                                color: yellowColor, shape: BoxShape.circle),
                            child: IconButton(
                                icon: Icon(
                                  LineAwesomeIcons.pen,
                                  size: SizeConfig.imageSizeMultiplier * 6,
                                  color: Colors.black,
                                ),
                                onPressed: null)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier*4,),
                 Text('${snapshot.data.firstname} ${snapshot.data.lastname}',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.textMultiplier * 2.2)),
                SizedBox(height: SizeConfig.heightMultiplier*1,),
                 Text('${snapshot.data.useremail}',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black38,
                              fontSize: SizeConfig.textMultiplier * 1.6))              
              ],
            ),
          ),
          Expanded(child: ListView(
            children: [
              GestureDetector(
                onTap: (){ Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>MyProfile()),
          );},
                              child: ProfileListItem(
                  icon: LineAwesomeIcons.user_shield,
                  text: 'My Profile',
                ),
              ),
             ProfileListItem(
                icon: LineAwesomeIcons.question_circle,
                text: 'Help & Support',
              ),
               snapshot.data.positionName=='Manager' ?GestureDetector(
                 onTap: (){
                   Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>AdminDashboard(
              token: snapshot.data.token,
              allPositions: _allPositions,
              allShops: _allShops,
              user: snapshot.data,
            )),
          );
          },
                                child: ProfileListItem(
                  icon: LineAwesomeIcons.user_cog,
                  text: 'Admin',
              ),
               ):Container(),
               GestureDetector(
                 onTap: () async{
                   await DatabaseClient().drop(); 
                   await DatabaseServiceProvider.removeToken();
                   Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Wrapper()),
          (route) => route.isFirst);
                          
                 },
                                child: ProfileListItem(
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'LogOut',
                  hasnaviagtion: false,
              ),
               ),
            ],
          ),),
         ],
      );
   
        }) );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasnaviagtion;
  ProfileListItem({this.icon,this.text,this.hasnaviagtion=true});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier*7,
      margin: EdgeInsets.symmetric(horizontal:SizeConfig.widthMultiplier*4).copyWith(bottom: SizeConfig.heightMultiplier*2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal:SizeConfig.widthMultiplier*4),
      child: Row(
        children: [
          Icon(this.icon),
          SizedBox(width: SizeConfig.widthMultiplier*3,),
           Text(this.text,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.textMultiplier * 2.2)),
            Spacer(),
            if(this.hasnaviagtion)
            Icon(LineAwesomeIcons.angle_right)                  
        ],
      ),
    );
  }
}