class UserDetails {
  int id;
   String token;
  String useremail;
  String firstname;
  String lastname;
  String positionName;
  String positionCode;
  UserDetails();
void fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.useremail = map['email'];
    this.firstname = map['firstname'];
    this.lastname = map['lastname'];
    this.token=map['token'];
    this.positionName=map['positionName'];
    this.positionCode=map['positionCode'];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map={
     'email':this.useremail,
      'token':this.token,
      'firstname':this.firstname,
      'lastname':this.lastname,
      'positionName':this.positionName,
      'positionCode':this.positionCode
       };
    if(id != null){
      map['id'] =this.id; 
    }
    return map;
  }
}

class AllUserList{
final String email;
  final String username;
  final String branchname;
 final String position;
 final String location;
 final String phonenumber;

  AllUserList({this.email, this.username, this.branchname, this.position, this.location, this.phonenumber});

}