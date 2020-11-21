class AllUsers {
  int id;
  String email;
  String  username;
  String lastname;
  String position;
  String status;
  AllUsers();
void fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.email = map['email'];
    this.username = map['username'];
    this.lastname = map['lastname'];
    this.position = map['position'];
    this.status = map['status'];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map={
      'id':this.id,
     'email':this.email,
      'username':this.username,
      'lastname':this.lastname,
      'position':this.position,
      'status':this.status
       };
   return map;
  }
}

class Positionss{
  int positionssId;
  String positionssName;
  List<int> positionssUserId;
  Positionss(this.positionssId,this.positionssName,this.positionssUserId);
}


class AllUserss {
  int id;
  String email;
  String  username;
  String lastname;
  String position;

  AllUserss(this.id,this.email,this.lastname,this.username,this.position);
  }

  class User {
  int name;
  int age;

  User(this.name, this.age);

  factory User.fromJson(dynamic json) {
    return User(json[''] as int, json[''] as int);
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.age} }';
  }}