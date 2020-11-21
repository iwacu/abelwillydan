class AllShop {
  int shopNumber;
  String  shopName;
  String shopSector;
  String shopDistrict;
 AllShop();
void fromMap(Map<String, dynamic> map){
  this.shopNumber=map['shopNumber'];
  this.shopName=map['shopName'];
  this.shopSector=map['shopSector'];
  this.shopDistrict=map['shopDistrict'];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map={
      'shopNumber':this.shopNumber,
       'shopName':this.shopName,
       'shopSector':this.shopSector,
       'shopDistrict':this.shopDistrict
       };
   return map;
  }
}
