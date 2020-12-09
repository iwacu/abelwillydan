class APIResponse<T,V,K> {
  T data;
  V shops;
  K shopAssinged;
  bool error;
  String errorMessage;

  APIResponse({this.data, this.shops,this.shopAssinged,this.errorMessage, this.error=false});
}
class ApiRegistrationResponse{
  String response;
  String email;
   ApiRegistrationResponse(this.response,this.email);
  factory ApiRegistrationResponse.fromJson(dynamic json) {
    return ApiRegistrationResponse(json['Response'] as String, json['email'] as String);
  }

  @override
  String toString() {
    return '{ ${this.response}, ${this.email}}';
  }
}

class ApiLoginResponse{
  String token;
  String useremail;
  String firstname;
  String lastname;
   String positionName;
  String positionCode;

  ApiLoginResponse(this.token,this.useremail,this.firstname,this.lastname,this.positionName,this.positionCode);
   factory ApiLoginResponse.fromJson(dynamic json) {
    return ApiLoginResponse(json['token'] as String,json['user_email'] as String,json['first_name'] as String,json['last_name'] as String,json['position_name'] as String,json['position_code'] as String);
  }

  @override
  String toString() {
    return '{ ${this.token},${this.useremail},${this.firstname},${this.lastname},${this.positionName}, ${this.positionCode}}';
  }
}

//All user class model
class SubAllUser{
   String useremail;
  String firstname;
  String lastname;
   SubAllUser(this.useremail,this.firstname,this.lastname);

  factory SubAllUser.fromJson(dynamic json) {
    return SubAllUser(json['email'] as String,json['last_name'] as String, json['first_name'] as String);
}
@override
  String toString() {
    return '{ ${this.useremail}, ${this.firstname},${this.lastname} }';
  }
}
class AllUser{
 int primaryKey;
 SubAllUser fields;
 AllUser(this.primaryKey,this.fields);
 factory AllUser.fromJson(dynamic json) {
    return AllUser(json['pk'] as int, SubAllUser.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}

//positions
class SubAllPositions{
   String positionName;
  String positionCode;
   SubAllPositions(this.positionName,this.positionCode);

  factory SubAllPositions.fromJson(dynamic json) {
    return SubAllPositions(json['position_name'] as String,json['position_code'] as String);
}
@override
  String toString() {
    return '{ ${this.positionName}, ${this.positionCode} }';
  }
}
class AllPositionsss{
 int primaryKey;
 SubAllPositions fields;
 AllPositionsss(this.primaryKey,this.fields);
 factory AllPositionsss.fromJson(dynamic json) {
    return AllPositionsss(json['pk'] as int, SubAllPositions.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}
//supervisor
class SubSupervisor{
   String firstName;
  String lastName;
  String email;
   SubSupervisor(this.firstName,this.lastName,this.email);

  factory SubSupervisor.fromJson(dynamic json) {
    return SubSupervisor(json['first_name'] as String,json['last_name'] as String,json['email'] as String);
}
@override
  String toString() {
    return '{ ${this.firstName}, ${this.lastName},${this.email} }';
  }
}
class Supervisor{
 int primaryKey;
 SubSupervisor fields;
 Supervisor(this.primaryKey,this.fields);
 factory Supervisor.fromJson(dynamic json) {
    return Supervisor(json['pk'] as int, SubSupervisor.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}

//assingedBy
class SubAssignedBy{
   String firstName;
  String lastName;
  String email;
   SubAssignedBy(this.firstName,this.lastName,this.email);

  factory SubAssignedBy.fromJson(dynamic json) {
    return SubAssignedBy(json['first_name'] as String,json['last_name'] as String,json['email'] as String);
}
@override
  String toString() {
    return '{ ${this.firstName}, ${this.lastName},${this.email} }';
  }
}
class AssignedBy{
 int primaryKey;
 SubAssignedBy fields;
 AssignedBy(this.primaryKey,this.fields);
 factory AssignedBy.fromJson(dynamic json) {
    return AssignedBy(json['pk'] as int, SubAssignedBy.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}



//All Position class model
class SubPostion{
 String positionName;
  String positionCode;
   SubPostion(this.positionName,this.positionCode);

  factory SubPostion.fromJson(dynamic json) {
    return SubPostion(json['position_name'] as String,json['position_code'] as String);
}
@override
  String toString() {
    return '{ ${this.positionName}, ${this.positionCode} }';
  }
}
class AllPosition{
 int primaryKey;
 SubPostion fields;
 AllPosition(this.primaryKey,this.fields);
 factory AllPosition.fromJson(dynamic json) {
    return AllPosition(json['pk'] as int, SubPostion.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}

//All Shops class model
class SubShops{
 String shopName;
  int shopCode;
   String shopSector;
  String shopDistrict;
  
   
   SubShops(this.shopName,this.shopCode,this.shopSector,this.shopDistrict);

  factory SubShops.fromJson(dynamic json) {
    return SubShops(json['shop_name'] as String,json['shop_no'] as int,json['sector'] as String,json['district'] as String,);
}
@override
  String toString() {
    return '{ ${this.shopName}, ${this.shopCode}, ${this.shopSector}, ${this.shopDistrict} }';
  }
}
class AllShopss{
 int primaryKey;
 String status;
 SubShops fields;
 AllShopss(this.primaryKey,this.status,this.fields);
 factory AllShopss.fromJson(dynamic json) {
    return AllShopss(json['pk'] as int,json['assignment_status'] as String ,SubShops.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}


//All Position class model
class SubPostionAssignment{
 int userId;
 int position;
 int supervisor;
 int assignedBy;
 String status;
   SubPostionAssignment(this.userId,this.position,this.supervisor,this.assignedBy,this.status);

  factory SubPostionAssignment.fromJson(dynamic json) {
    return SubPostionAssignment(json['user'] as int,json['position'] as int,json['supervisor'] as int,json['assigned_by'] as int,json['assignment_status'] as String);
}
@override
  String toString() {
    return '{ ${this.userId}, ${this.position}, ${this.supervisor}, ${this.assignedBy}, ${this.status} }';
  }
}
class AllPositionAssignment{
 int primaryKey;
 SubPostionAssignment fields;
 AllPositionAssignment(this.primaryKey,this.fields);
 factory AllPositionAssignment.fromJson(dynamic json) {
    return AllPositionAssignment(json['pk'] as int, SubPostionAssignment.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}

class Person {
  const Person(
    this.status,
      this.id,
  this.assignedBy,
    this.supervisor,
    this.lastname,
    this.firstname,
    this.positionName,
    this.positionEmail,
    this.positionId,
  );
  final String status;
  final int id;
  final String assignedBy;
  final String supervisor;
  final String lastname;
  final String firstname;
  final String positionName;
  final String positionEmail;
  final int positionId;

  
  Map<String, dynamic> toMap(){
    return {'positionName': positionName,  'positionemail':positionEmail,'positionId': positionId,'firstname':firstname,'lastname':lastname, 'supervisor':supervisor,'assignedBy':assignedBy,'id':id,'status':status};
  }
  
  bool operator ==(other) => other is Person && other.positionName == positionName && other.positionEmail == positionEmail && other.positionId == positionId && other.firstname==firstname && other.lastname==lastname;
	// int get hashCode => hash2(name.hashCode, age.hashCode);
  int get hashCode => positionName.hashCode^positionEmail.hashCode^positionId.hashCode^firstname.hashCode^lastname.hashCode;
}

//All user

class AllUsersss{
 AllUser allUser;
 AllPositionsss allPositions;
 String assignmentStatus;
 Supervisor supervisor;
AssignedBy assignedBy;
 AllUsersss(this.allUser,this.allPositions,this.assignmentStatus,this.supervisor,this.assignedBy);
 factory AllUsersss.fromJson(dynamic json) {
    return AllUsersss(AllUser.fromJson(json['user']),AllPositionsss.fromJson(json['position']),json['assignment_status'] as String,Supervisor.fromJson(json['supervisor']),AssignedBy.fromJson(json['assigned_by']),);
  }
}

class AllUserssss{
  int id;
  AllUsersss allUser;
  AllUserssss(this.id,this.allUser);
  factory AllUserssss.fromJson(dynamic json) {
    return AllUserssss(json['pk'] as int,AllUsersss.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.id},${this.allUser}}';
  }
}

//All shop class model
class SubShopAssignment{
 AssignedBy assignedBy; 
 AllShopss shop; 
 AllUser allUser;
 String status;
   SubShopAssignment(this.assignedBy,this.shop,this.allUser,this.status);

  factory SubShopAssignment.fromJson(dynamic json) {
    return SubShopAssignment(AssignedBy.fromJson(json['assigned_by']),AllShopss.fromJson(json['shop']),AllUser.fromJson(json['user']),json['assignment_status'] as String);
}
}
class AllShopAssignment{
 int primaryKey;
 SubShopAssignment fields;
 AllShopAssignment(this.primaryKey,this.fields);
 factory AllShopAssignment.fromJson(dynamic json) {
    return AllShopAssignment(json['pk'] as int, SubShopAssignment.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}

class AssingedShop{
  const AssingedShop(
    this.id,
    this.assignedBy,
    this.email,
    this.status,
    this.shopname,
    this.lastname,
    this.firstname,
    this.positionId,
  );
  final int id;
  final String status;
  final String email;
  final String shopname;
  final String assignedBy;
  final String lastname;
  final String firstname;
  final int positionId;

  
  Map<String, dynamic> toMap(){
    return {'positionId': positionId,'firstname':firstname,'lastname':lastname, 'status':status,'assignedBy':assignedBy,'email':email,'shopname':shopname,'id':id};
  }
  
  bool operator ==(other) => other is AssingedShop && other.positionId == positionId && other.firstname==firstname && other.lastname==lastname&& other.shopname == shopname && other.status == status ;
	// int get hashCode => hash2(name.hashCode, age.hashCode);
  int get hashCode => shopname.hashCode^status.hashCode^positionId.hashCode^firstname.hashCode^lastname.hashCode;
}