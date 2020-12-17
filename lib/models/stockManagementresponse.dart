class APIStockMgtResponse<B,P,C,S> {
  B brands;
  P phoneModel;
  C colors;
  S storages;
  bool error;
  String errorMessage;

  APIStockMgtResponse({this.brands,this.phoneModel,this.colors,this.storages,this.errorMessage, this.error=false});
}
//Brands
class SubAllBrands{
  int phoneType;
  String brandName;
   SubAllBrands(this.brandName,this.phoneType);

  factory SubAllBrands.fromJson(dynamic json) {
    return SubAllBrands(json['brand_name'] as String,json['phone_type'] as int);
}
@override
  String toString() {
    return '{ ${this.brandName}, ${this.phoneType} }';
  }
}
class AllBrands{
 int primaryKey;
 SubAllBrands fields;
 AllBrands(this.primaryKey,this.fields);
 factory AllBrands.fromJson(dynamic json) {
    return AllBrands(json['pk'] as int, SubAllBrands.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}

//Colors
class SubAllColors{

  String colorName;
   SubAllColors(this.colorName);

  factory SubAllColors.fromJson(dynamic json) {
    return SubAllColors(json['color_name'] as String);
}
@override
  String toString() {
    return '{ ${this.colorName}}';
  }
}
class AllColors{
 int primaryKey;
 SubAllColors fields;
 AllColors(this.primaryKey,this.fields);
 factory AllColors.fromJson(dynamic json) {
    return AllColors(json['pk'] as int, SubAllColors.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}


//Storage
class SubAllStorage{

  String storageSize;
   SubAllStorage(this.storageSize);

  factory SubAllStorage.fromJson(dynamic json) {
    return SubAllStorage(json['storage_size'] as String);
}
@override
  String toString() {
    return '{ ${this.storageSize}}';
  }
}
class AllStorage{
 int primaryKey;
 SubAllStorage fields;
 AllStorage(this.primaryKey,this.fields);
 factory AllStorage.fromJson(dynamic json) {
    return AllStorage(json['pk'] as int, SubAllStorage.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}
//phone Model
class SubPhoneModelDetails{
 String brandName;
 int phoneType;
 SubPhoneModelDetails(this.brandName,this.phoneType);
  factory SubPhoneModelDetails.fromJson(dynamic json) {
    return SubPhoneModelDetails(json['brand_name'] as String,json['phone_type'] as int);
}
@override
  String toString() {
    return '{ ${this.brandName},${this.phoneType}}';
  }
}

class SubPhoneModelType{
  int primayKey;
  SubPhoneModelDetails subPhoneModelType;
   SubPhoneModelType(this.primayKey,this.subPhoneModelType);

  factory SubPhoneModelType.fromJson(dynamic json) {
    return SubPhoneModelType(json['pk'] as int,SubPhoneModelDetails.fromJson(json['fields']));
}
@override
  String toString() {
    return '{ ${this.primayKey},${this.subPhoneModelType}}';
  }
}

class SubPhoneModel{
  String phoneModel;String phoneProcessor;String phoneRam;String phonecfrt;String phonecbk;String phonescrnz
   ;String phoneresolution;String phonebtrlf;String phonebtrtype;String phoneos;
  
  SubPhoneModelType subPhoneModelType;
   SubPhoneModel(
     this.phoneModel,
     this.phoneProcessor,
     this.phoneRam,
     this.phonecfrt,
     this.phonecbk,
     this.phonescrnz,
     this.phoneresolution,
     this.phonebtrlf,
     this.phonebtrtype,
     this.phoneos,
     this.subPhoneModelType);

  factory SubPhoneModel.fromJson(dynamic json) {
    return SubPhoneModel(
      json['model_name'] as String,
      json['processor'] as String,
      json['ram'] as String,
      json['camera_front'] as String,
      json['camera_back'] as String,
      json['screen_size'] as String,
      json['screen_resolution'] as String,
      json['battery_life'] as String,
      json['battery_type'] as String,
      json['operating_system'] as String,
      SubPhoneModelType.fromJson(json['brand']));
}
@override
  String toString() {
    return '{ ${this.phoneModel},${this.phoneProcessor},${this.phoneRam},${this.phonecfrt},${this.phonecbk},${this.phoneresolution},${this.phonescrnz},${this.phonebtrlf},${this.phonebtrtype},${this.phoneos}${this.subPhoneModelType}}';
  }
}
class PhoneModel{
 int primaryKey;
 SubPhoneModel fields;
 PhoneModel(this.primaryKey,this.fields);
 factory PhoneModel.fromJson(dynamic json) {
    return PhoneModel(json['pk'] as int, SubPhoneModel.fromJson(json['fields']));
  }
  @override
  String toString() {
    return '{ ${this.primaryKey}, ${this.fields} }';
  }
}