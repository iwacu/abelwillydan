import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phonestockmgt/models/allPositions.dart';
import 'package:phonestockmgt/models/allShops.dart';
import 'package:phonestockmgt/models/allUser.dart';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/models/positionassignment.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient{
  Database _database;
   Future<Database> get database async{
    if(_database !=null){
      return _database;
    } else{
      //create database
      _database = await create();
    return _database;
    }
  }

  Future create() async{
  Directory directory = await getApplicationDocumentsDirectory();
  String database_directory= join(directory.path, 'database.db');
  var db =await openDatabase(database_directory,version:1,onCreate:_oncreate);
  return db;
  }
  
   Future _oncreate(Database bd,int version) async{
    await bd.execute(''' 
    CREATE TABLE UserItem (
    firstname TEXT NULL,
     lastname TEXT NOT NULL,
     email TEXT NOT NULL,
     token TEXT NOT NULL,
     positionName TEXT NOT NULL,
     positionCode TEXT NOT NULL )
    ''');
     await bd.execute(''' 
    CREATE TABLE AllPositionTable (
     id INTEGER, 
     positionName TEXT NOT NULL,
     positionCode TEXT NOT NULL)
    ''');
     await bd.execute(''' 
    CREATE TABLE AllShopsTable (
     shopNumber INTEGER, 
     shopName TEXT NOT NULL,
     shopSector TEXT NOT NULL,
     shopDistrict TEXT NULL)
    ''');
    
    }
    //delete table
  Future delete(String table) async{
    Database mydatabase = await database;
    await mydatabase.delete(table);
   
  }

     //ADD USERITEM details to DATABASE Table
  Future<UserDetails> add(UserDetails item) async{

   Database mydatabase = await database;
   await mydatabase.transaction((txn) async{
     await txn.rawInsert('INSERT INTO UserItem(firstname,lastname ,email,token,positionName,positionCode) VALUES("${item.lastname}","${item.firstname}","${item.useremail}","${item.token}","${item.positionName}","${item.positionCode}")');
   });
   print('hhhhhhhhhhhhhhhhhhhh UserItem Inserted');
  //await mydatabase.insert('UserItem', item.toMap());
   return item;
  }
  //add all users to the database
   Future addAllUsers(List<Person> users) async{
   Database mydatabase = await database;
   await mydatabase.transaction((txn) async{
    
    users.forEach((user) async{
       await txn.rawInsert('INSERT INTO AllUserTable(id,email,username,lastname,position,status) VALUES("${user.positionId}","${user.positionEmail}","${user.firstname}","${user.lastname}","${user.positionName}","")');
   
   });
  
    });
    print('hhhhhhhhhhhhhhhhhhhh AllUsers Inserted');
  }
Future<AllPosition> assiged(AllUser user,List<AllPositionAssignment> assigned,List<AllPosition> allPosition)async{
  final assigns =   await positionass(user,assigned);
   AllPosition position = allPosition.where((element) => element.primaryKey==assigns.fields.position).single;
   
   return position;
 }
 Future<AllPositionAssignment> positionass(AllUser user,List<AllPositionAssignment> assigned)async{
   return assigned.where((element) => element.fields.userId==user.primaryKey).single;
 }

   //add all position to the database
   Future addAllPosition(List<AllPosition> positions) async{
   Database mydatabase = await database;
   await mydatabase.transaction((txn) async{
    positions.forEach((position) async{
     await txn.rawInsert('INSERT INTO AllPositionTable(id,positionName,positionCode) VALUES("${position.primaryKey}","${position.fields.positionName}","${position.fields.positionCode}")');
   });
  
    });
    print('hhhhhhhhhhhhhhhhhhhh Allpopsitions inserted ${positions.length.toString()}');
  }
  //add all shops to the database
   Future addAllShops(List<AllShopss> shops) async{
   Database mydatabase = await database;
   await mydatabase.transaction((txn) async{
    shops.forEach((shop) async{
      print(shop.fields.shopName);
     await txn.rawInsert('INSERT INTO AllShopsTable(shopNumber,shopName,shopSector,shopDistrict) VALUES("${shop.fields.shopCode}","${shop.fields.shopName}","${shop.fields.shopSector}","${shop.fields.shopDistrict}")');
   });
  
    });
    print('hhhhhhhhhhhhhhhhhhhh AllShops Inserted ${shops.length.toString()}');
  }

  //add all assignedposition to the database
   Future addAllAssignedPosition(List<AllPositionAssignment> assigned) async{
   Database mydatabase = await database;
   await mydatabase.transaction((txn) async{
    assigned.forEach((shop) async{
     await txn.rawInsert('INSERT INTO AllPositionAssignmentTable(pk,userId,position,supervisor,assignedBy,status) VALUES("${shop.primaryKey}","${shop.fields.userId}","${shop.fields.position}","${shop.fields.supervisor}","${shop.fields.assignedBy}","${shop.fields.status}")');
   });
  
    });
    print('hhhhhhhhhhhhhhhhhhhh AllPositionAssignmentTable Inserted');
  }

  //read userlogin data
  Future<UserDetails> item() async{
     Database mydatabase = await database;
     List<Map<String, dynamic>> result= await mydatabase.rawQuery('SELECT * FROM UserItem');
     List<UserDetails> items=[];
     UserDetails ite =UserDetails();
     result.forEach((map) {
      print(map.values);
       
       ite.fromMap(map); 
      
       });
     return ite;
   
  }
  //Stream userLogin details from database
  Stream<UserDetails> get userList {
    return Stream.fromFuture(item());
  }
  
  //read all users for manager
  Future<List<AllUsers>> allUser()async{
    Database mydatabase = await database;
     List<Map<String, dynamic>> result= await mydatabase.rawQuery('SELECT * FROM AllUserTable');
     List<AllUsers> allUsers=[];
     
     result.forEach((map) { 
        print(map.values);
       AllUsers user=AllUsers();
       user.fromMap(map);
       allUsers.add(user);
     });
     return allUsers;
  }
  //stream alluser from database
  Stream<List<AllUsers>> get allUsersList{
    return Stream.fromFuture(allUser());
  }

  //read all position for manager
  Future<List<AllPositions>> allPositions()async{
    Database mydatabase = await database;
     List<Map<String, dynamic>> result= await mydatabase.rawQuery('SELECT * FROM AllPositionTable');
     List<AllPositions> allPositions=[];
     print('herreererer');
     result.forEach((map) { 
        print(map.values);
       AllPositions position=AllPositions();
       position.fromMap(map);
       allPositions.add(position);
     });
     return allPositions;
  }
  //stream all position from database
  Stream<List<AllPositions>> get allPositionsList{
    return Stream.fromFuture(allPositions());
  }

   //read all shops for manager
  Future<List<AllShop>> allShops()async{
    Database mydatabase = await database;
     List<Map<String, dynamic>> result= await mydatabase.rawQuery('SELECT * FROM AllShopsTable');
     List<AllShop> allShops=[];
     print('shops');
     result.forEach((map) { 
       print(map.values);
       AllShop position=AllShop();
       position.fromMap(map);
       allShops.add(position);
     });
     return allShops;
  }
  //stream alluser from database
  Stream<List<AllShop>> get allShopsList{
    return Stream.fromFuture(allShops());
  }

  //read all assignedpostion for manager
  Future<List<PositionAssignment>> allAssigned()async{
    Database mydatabase = await database;
     List<Map<String, dynamic>> result= await mydatabase.rawQuery('SELECT * FROM AllPositionAssignmentTable');
     List<PositionAssignment> allPosition=[];
     result.forEach((map) { 
    //   print(map.values);
       PositionAssignment position=PositionAssignment();
       position.fromMap(map);
       allPosition.add(position);
     });
     return allPosition;
  }
  //stream alluser from database
  Stream<List<PositionAssignment>> get allPositionassignedList{
    return Stream.fromFuture(allAssigned());
  }

  //drop table
   Future drop() async {
     Database mydatabase = await database;
    await mydatabase.execute("DROP TABLE IF EXISTS UserItem");
    await mydatabase.execute("DROP TABLE IF EXISTS AllPositionTable");
    await mydatabase.execute("DROP TABLE IF EXISTS AllShopsTable");
     print('deleted');
    await mydatabase.execute(''' 
    CREATE TABLE UserItem (
     firstname TEXT NULL,
     lastname TEXT NOT NULL,
     email TEXT NOT NULL,
     token TEXT NOT NULL,
     positionName TEXT NOT NULL,
     positionCode TEXT NOT NULL)
    ''');
    print('useritem table');
     await mydatabase.execute(''' 
    CREATE TABLE AllPositionTable (
     id INTEGER, 
     positionName TEXT,
     positionCode TEXT)
    ''');
     print('created allpositiontable');
     await mydatabase.execute(''' 
    CREATE TABLE AllShopsTable (
     shopNumber INTEGER, 
     shopName TEXT NOT NULL,
     shopSector TEXT NOT NULL,
     shopDistrict TEXT NULL)
    ''');
    
     
   }

    Future<dynamic> ittem() async{
     Database mydatabase = await database;
     List<Map<String, dynamic>> result= await mydatabase.rawQuery('SELECT * FROM UserItem');
    //  List<UserDetails> items=[];
    //  UserDetails ite =UserDetails();
    //  result.forEach((map) {
    //    print(map.values);
       
    //    ite.fromMap(map); 
      
    //    });
     return result;
   
  }
 
}