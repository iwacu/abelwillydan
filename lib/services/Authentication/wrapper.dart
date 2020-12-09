import 'package:flutter/material.dart';
import 'package:phonestockmgt/models/allPositions.dart';
import 'package:phonestockmgt/models/allShops.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/services/Database/database.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';
import 'package:phonestockmgt/widgets/OnboradingScreen/onBoardingScreen.dart';
import 'package:phonestockmgt/widgets/homepage/homepage.dart';
import 'package:phonestockmgt/widgets/registration_signin/login.dart';
import 'package:provider/provider.dart';

//this class checks if a user is logged_in ;if yes display MenuFrame ;if no display login page
class Wrapper extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MultiProvider(
         providers: [
        StreamProvider<UserDetails>.value(
         value:DatabaseClient().userList,),
           StreamProvider<List<AllPositions>>.value(
           value:DatabaseClient().allPositionsList),
           StreamProvider<List<AllShop>>.value(
           value:DatabaseClient().allShopsList),
          ],
          
          child: Material(
                      child: FutureBuilder(
        future: DatabaseServiceProvider.getToken(),
        builder: (_, snapshot){
            if(snapshot.connectionState ==ConnectionState.waiting)
            {
              return CircularProgressIndicator();
            }else if(snapshot.hasData){
              return WrapperPostion();
            }else {
              return LoginPage();
            }
        }),
          ),
    );
        }
}


//this class checks if a user has position assigned ;if yes display HomePage ;if no display waiting page
class WrapperPostion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return StreamBuilder(
      stream: DatabaseClient().item().asStream(),
      builder: (context,AsyncSnapshot<UserDetails>snapshot){
         if(snapshot.data==null){
           return Scaffold(
             body: Loading(),
           );
         } else{
           print('hhhhhhhhhhhhhhhhhhh${snapshot.data.positionName}');
          
           return (snapshot.data.positionName=='')?
           OnBoardingScreen(firstName: snapshot.data.firstname,lastName: snapshot.data.lastname,email: snapshot.data.useremail,) : HomePage();
         }
        //  else if(snapshot.data.positionName==null && snapshot.data.positionCode==null){
        //   return Scaffold(
        //      body: Center(
        //        child: Text('null'),
        //      ),
        //    );
        // }
        // else if(snapshot.data.positionName!=null && snapshot.data.positionCode!=null)
        // {
        //   return HomePage();
        // }
        // else {
        //   return WaitingPosition(firstName: snapshot.data.firstname,lastName: snapshot.data.lastname,email: snapshot.data.useremail,);
        // }
      });
      
  }

}