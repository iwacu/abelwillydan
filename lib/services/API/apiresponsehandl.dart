import 'dart:convert';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/services/Database/database.dart';

import 'apis.dart';

class ApiResponse {
  //response from API
  Future<APIResponse<List<Person>, List<AllShopss>, List<AssingedShop>>>
      userManagement({String token}) async {
    try {
      final response = await DatabaseServiceProvider().userAll(token);
      if (response.statusCode == 200) {
        String responseBody = response.body;
        List<Person> fullpersondetails = await getAllUserDetails(responseBody);
        List<AllShopss> allShops = await getAllShops(responseBody);
        List<AssingedShop> assignedShops =
            await allShopAssignment(responseBody);
        return APIResponse<List<Person>, List<AllShopss>, List<AssingedShop>>(
            data: fullpersondetails,
            shops: allShops,
            shopAssinged: assignedShops);
      }
      return APIResponse<List<Person>, List<AllShopss>, List<AssingedShop>>(
          error: true, errorMessage: 'An error occured');
    } catch (e) {
      return APIResponse<List<Person>, List<AllShopss>, List<AssingedShop>>(
          error: true, errorMessage: 'An error occured');
    }
  }

  //getting all user informations (id,username,lastname,email,position,status)
  Future<List<Person>> getAllUserDetails(String update) async {
    //decode all users json
    var allUsers = jsonDecode(update)['all_users'] as List;
    //decode all_asssigned_position json
    var assignedposition = jsonDecode(update)['position_assignments'] as List;
    //all_user object
    List<AllUser> allUer = allUsers
        .map((respJson) => AllUser.fromJson(respJson))
        .toList(); //all_position object
    //all_assigned_position object
    List<AllUserssss> allUser =
        assignedposition.map((assin) => AllUserssss.fromJson(assin)).toList();
    //map user Id and position name
    var mapPositionNameIdUser = {
      for (var f in allUser)
        f.allUser.allUser.primaryKey: f.allUser.allPositions.fields.positionName
    };
    //map user Id and Supervisor email
    var mapSupervisorNameIdUser = {
      for (var f in allUser)
        f.allUser.allUser.primaryKey: f.allUser.supervisor.fields.email
    };
    //map user Id and Assignedby email
    var mapAssignedbyIdUser = {
      for (var f in allUser)
        f.allUser.allUser.primaryKey: f.allUser.assignedBy.fields.email
    };
    var ids={
       for (var f in allUser)
        f.allUser.allUser.primaryKey:f.id
    };
    var status={
      for (var f in allUser)
        f.allUser.allUser.primaryKey:f.allUser.assignmentStatus
    };

    //creating full_Person_details object
    var persons = [
      for (var n in allUer)
        Person(
            status[n.primaryKey],
            ids[n.primaryKey],
            mapAssignedbyIdUser[n.primaryKey],
            mapSupervisorNameIdUser[n.primaryKey],
            n.fields.lastname,
            n.fields.firstname,
            mapPositionNameIdUser[n.primaryKey],
            n.fields.useremail,
            n.primaryKey)
    ];
    for (var ui in persons) {
      print(
          '${ui.id},${ui.status},${ui.positionId},${ui.positionName},${ui.positionEmail},${ui.firstname},${ui.lastname},${ui.assignedBy},${ui.supervisor}');
    }
    return persons;
  }

  //getting all shop assignment
  Future<List<AssingedShop>> allShopAssignment(String update) async {
    //decode all users json
    var allUsers = jsonDecode(update)['all_users'] as List;
    //decode all_asssigned_position json
    var assignedShop = jsonDecode(update)['shops_assignment_json_obj'] as List;
    //all_user object
    List<AllUser> allUer =
        allUsers.map((respJson) => AllUser.fromJson(respJson)).toList();
    //all shop assigned object
    List<AllShopAssignment> allShops = assignedShop
        .map((respJson) => AllShopAssignment.fromJson(respJson))
        .toList();
      
    //map user Id and shop name
    var mapPositionNameIdUser = {
      for (var f in allShops)
        f.fields.allUser.primaryKey: f.fields.shop.fields.shopName
    };
     var mapPositionNameId = {
      for (var f in allShops)
        f.fields.allUser.primaryKey: f.primaryKey
    };
    var status = {
      for (var f in allShops) f.fields.allUser.primaryKey: f.fields.status
    };
    var mapAssignedbyIdUser = {
      for (var f in allShops)
        f.fields.allUser.primaryKey: f.fields.assignedBy.fields.email
    };
    var shops = [
      for (var n in allUer)
        AssingedShop(
            mapPositionNameId[n.primaryKey],
            mapAssignedbyIdUser[n.primaryKey],
            n.fields.useremail,
            status[n.primaryKey],
            mapPositionNameIdUser[n.primaryKey],
            n.fields.lastname,
            n.fields.firstname,
            n.primaryKey)
    ];
  for(var ji in shops){
    print('${ji.id},${ji.firstname},${ji.shopname},${ji.status}');
  }
    return shops;
  }

  //geting all registered shops
  Future<List<AllShopss>> getAllShops(String update) async {
    var shops = jsonDecode(update)['all_shops'] as List;
    List<AllShopss> allShops =
        shops.map((respJson) => AllShopss.fromJson(respJson)).toList();
    return allShops;
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
    for (var ji in allShops)
      print(
          'shops ${ji.fields.shopName},shops ${ji.fields.shopDistrict},shops ${ji.fields.shopSector}');
    //insert all positions to database
    await DatabaseClient().addAllPosition(allPosition);
    //insert all_shops to database
    await DatabaseClient().addAllShops(allShops);
  }
}
//rutayirewilly@gmail.com alx kamuisha storekeeper
