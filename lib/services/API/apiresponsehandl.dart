import 'dart:convert';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/services/Database/database.dart';

import 'apis.dart';

class ApiResponse {
  //response from API
 Future<APIResponse<List<Person>>> userManagement({String token}) async {
   try {
      final response = await DatabaseServiceProvider().userAll(token);
    if(response.statusCode==200){
      String responseBody = response.body;
    List<Person> fullpersondetails = await getAllUserDetails(responseBody);
    return APIResponse<List<Person>>(data:fullpersondetails);
    }
    return APIResponse<List<Person>>(error: true, errorMessage: 'An error occured');
   } catch (e) {
     return APIResponse<List<Person>>(error: true, errorMessage: 'An error occured');
   }
  }
  //getting all user informations (id,username,lastname,email,position,status) 
  Future<List<Person>> getAllUserDetails(String update) async {
    //decode all users json
    var allUsers = jsonDecode(update)['all_users'] as List;
    //decode all_asssigned_position json
    var assignedposition = jsonDecode(update)['position_assignments'] as List;
    //all_user object
      List<AllUser> allUer =
        allUsers.map((respJson) => AllUser.fromJson(respJson)).toList(); //all_position object
    //all_assigned_position object
   List<AllUserssss> allUser =
        assignedposition.map((assin) => AllUserssss.fromJson(assin)).toList();
        //map user Id and position name
    var mapPositionNameIdUser = {for (var f in allUser) f.allUser.allUser.primaryKey: f.allUser.allPositions.fields.positionName};
        //map user Id and Supervisor email
    var mapSupervisorNameIdUser = {for (var f in allUser) f.allUser.allUser.primaryKey: f.allUser.supervisor.fields.email};
         //map user Id and Assignedby email
    var mapAssignedbyIdUser = {for (var f in allUser) f.allUser.allUser.primaryKey: f.allUser.assignedBy.fields.email};
    
    
         //creating full_Person_details object
var persons = [
      for (var n in allUer)
        Person(mapAssignedbyIdUser[n.primaryKey],mapSupervisorNameIdUser[n.primaryKey],n.fields.lastname, n.fields.firstname, mapPositionNameIdUser[n.primaryKey],
            n.fields.useremail, n.primaryKey)];
             for(var ui in persons){
           print('${ui.positionId},${ui.positionName},${ui.positionEmail},${ui.firstname},${ui.lastname},${ui.assignedBy},${ui.supervisor}');
         }
   return persons;
  }

  //
  //getting All shops nas positions from api
  Future getShopAndPositions(String token) async {
    final response = await DatabaseServiceProvider().userAll(token);
    var positions = jsonDecode(response.body)['all_positions'] as List;
    var shops = jsonDecode(response.body)['all_shops'] as List;
  //decode from json to obect_position
  print(shops);
    List<AllPosition> allPosition =
        positions.map((respJson) => AllPosition.fromJson(respJson)).toList();
    //decode from json to obect_shops
    List<AllShopss> allShops =
        shops.map((respJson) => AllShopss.fromJson(respJson)).toList();
        for(var ji in allShops)
        print('shops ${ji.fields.shopName}');
    //insert all positions to database
     await DatabaseClient().addAllPosition(allPosition);
     //insert all_shops to database
    await DatabaseClient().addAllShops(allShops);
   
  }
  
}
//rutayirewilly@gmail.com alx kamuisha storekeeper
