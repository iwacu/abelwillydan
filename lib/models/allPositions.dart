class AllPositions {
  int id;
  String positionName;
  String  positionCode;
 AllPositions();
void fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.positionName = map['positionName'];
    this.positionCode = map['positionCode'];
    
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map={
      'id':this.id,
     'positionName':this.positionName,
      'positionCode':this.positionCode,
       };
   return map;
  }
}
