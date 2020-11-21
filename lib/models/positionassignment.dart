class PositionAssignment {
  int pk;
  int userId;
 int position;
 int supervisor;
 int assignedBy;
 String status;
 PositionAssignment();
void fromMap(Map<String, dynamic> map){
    this.pk = map['pk'];
    this.userId = map['userId'];
    this.position = map['position'];
    this.supervisor = map['supervisor'];
    this.assignedBy = map['assignedBy'];
    this.status = map['status'];
    
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map={
      'pk':this.pk,
     'userId':this.userId,
      'position':this.position,
      'supervisor':this.supervisor,
      'assignedBy':this.assignedBy,
      'status':this.status
       };
   return map;
  }
}
