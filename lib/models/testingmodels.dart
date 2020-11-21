class Stock{
 final int id;
 final String title;
 final String description;
 final String color;
 final bool pay;

 Stock({
   this.pay,
   this.color,
   this.id,
   this.title,
   this.description,
 });
factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
        id: json['id'], title: json['title'], description: json['description']);
  }
 // dynamic toJson() => {'id': id, 'title': title, 'description': description};


}

class Brand{
  final int id;
 final String title;
 
Brand({
  this.id,
   this.title,
  });
}

class ModelBrand{
  final int id;
 final String modelName;
 final String cameraFront;
 final String camerBack;
 final String ram;
 final String screenSize;
 final String screenresolution;
 final String batterylife;
 final String processor;
 final String batteryType;
 final int brandId;
 final String os;
 
ModelBrand({
  this.id,
  this.brandId,
  this.batteryType,this.batterylife,this.camerBack,
  this.cameraFront,this.modelName,this.os,this.processor,this.ram,this.screenSize,this.screenresolution,
  });
}

class StockItem{
   final int id;
   final String imei;
   final String brandName;
 final String modelName;
 final String cameraFront;
 final String camerBack;
 final String ram;
 final String screenSize;
 final String screenresolution;
 final String batterylife;
 final String processor;
 final String batteryType;
 final int brandId;
 final String os;
 final String color;
 final String storage;
 
StockItem({
  this.imei,
  this.id,
  this.brandName,
  this.brandId,
  this.color,
  this.storage,
  this.batteryType,this.batterylife,this.camerBack,
  this.cameraFront,this.modelName,this.os,this.processor,this.ram,this.screenSize,this.screenresolution,
  });
}
