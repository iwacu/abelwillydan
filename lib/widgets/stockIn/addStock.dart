import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/testingmodels.dart';

class AddStock extends StatefulWidget {
  @override
  _AddStockState createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  TextEditingController _barcodeText = TextEditingController();
  String _barcode = '';
  Brand _brandd;

  List<ModelBrand> model = [
    ModelBrand(
        id: 1,
        modelName: '7',
        camerBack: '12',
        cameraFront: '8',
        processor: '2.5',
        ram: '3',
        screenSize: '1x3x4',
        screenresolution: '1280*720',
        batteryType: 'Li-io',
        batterylife: '2500mAh',
        brandId: 1,
        os: 'IOS'),
    ModelBrand(
        id: 2,
        modelName: '8',
        camerBack: '12',
        cameraFront: '8',
        processor: '2.5',
        ram: '3',
        screenSize: '1x3x4',
        screenresolution: '1280*720',
        batteryType: 'Li-io',
        batterylife: '2500mAh',
        brandId: 1,
        os: 'IOS'),
    ModelBrand(
        id: 3,
        modelName: 's6',
        camerBack: '12',
        cameraFront: '8',
        processor: '2.5',
        ram: '10',
        screenSize: '1x3x4',
        screenresolution: '1280*720',
        batteryType: 'Li-io',
        batterylife: '2500mAh',
        brandId: 2,
        os: 'Android'),
    ModelBrand(
        id: 4,
        modelName: 's10',
        camerBack: '12',
        cameraFront: '8',
        processor: '2.5',
        ram: '3',
        screenSize: '1x3x4',
        screenresolution: '1280*720',
        batteryType: 'Li-io',
        batterylife: '2500mAh',
        brandId: 2,
        os: 'Android'),
  ];
  ModelBrand mok;
  List<Brand> stock = [
    Brand(id: 1, title: 'Iphone'),
    Brand(id: 2, title: 'Samsung'),
    Brand(id: 3, title: 'Huawei'),
    Brand(id: 4, title: 'Oppo'),
    Brand(id: 5, title: 'Tecno')
  ];

  String _brand;
  String _modelBrand;

  String _processor = '';
  String _ram = '';
  String _cameraFront = '';
  String _camerBack = '';
  String _screenSize = '';
  String _screenResolution = '';
  String _batterylife = '';
  String _batteryType = '';
  String _os = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Add-Stock",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
                 Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(

              children: <Widget>[
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                        _barcodeText.clear();
                        _processor = '';
                        _ram = '';
                        _cameraFront = '';
                        _camerBack = '';
                        _screenSize = '';
                        _screenResolution = '';
                        _batterylife = '';
                        _batteryType = '';
                        _os = '';
                      });
                                          },
                                                                                  child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:8,
                                                  vertical:8
                                                ),
                                height: SizeConfig.heightMultiplier*5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: neumorpShadow,
                                    color: Color(0xFFCADCED),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete,color: Colors.black45,size: 5*SizeConfig.imageSizeMultiplier,),
                                      Text(
                                                'Clear',
                                                style: TextStyle(
                                                  //fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black38,
                                                ),
                                              ),
                                    ],
                                  ),
                              ),
                                        ),
                Spacer(),              
               Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:8,
                                                vertical:8
                                              ),
                                height: SizeConfig.heightMultiplier*5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: neumorpShadow,
                                    color: Color(0xFFCADCED),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(LineAwesomeIcons.plus,color: Colors.black45,size: 5*SizeConfig.imageSizeMultiplier,),
                                      Text(
                                              'Save',
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                                                color: Colors.black38,
                                              ),
                                            ),
                                    ],
                                  ),
                              ),
                              
              ],
            ),
          ),
     
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 23),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'BarCode',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: SizeConfig.widthMultiplier * 62,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(
                        controller: _barcodeText,
                        decoration: InputDecoration(
                          icon: Icon(LineAwesomeIcons.barcode),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () async {
                        try {
                          String _barcode = await BarcodeScanner.scan();
                          setState(() {
                            this._barcode = _barcode;
                            _barcodeText.text = _barcode;
                          });
                        } on PlatformException catch (e) {
                          if (e.code == BarcodeScanner.CameraAccessDenied) {
                            setState(() {
                              _barcode = 'camera permission not granted';
                            });
                          } else {
                            setState(() {
                              this._barcode = 'Unknown error: $e';
                            });
                          }
                        } on FormatException {
                          setState(() {
                            this._barcode =
                                'null (Users returning using the "back button")';
                          });
                        } catch (e) {
                          setState(() {
                            this._barcode = "Unknown error: $e";
                          });
                        }
                      },
                      child: Container(
                          height: 20,
                          child:
                              Image.asset('assets/images/barcodeScanner.png')))
                  // GestureDetector(
                  //   onTap:_scan(),
                  //   child: Container(
                  //       height: 20,
                  //       child: Image.asset('assets/images/barcodeScanner.png')),
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 23),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Brand Name',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      child: DropdownButton(
                    hint: Text('Brand-Name'),
                    value: _brand,
                    onChanged: (newValue) {
                      setState(() {
                        _brand = newValue;
                      });
                      print(_brand);
                    },
                    items: stock.map((location) {
                      return DropdownMenuItem(
                        onTap: () {
                          setState(() {
                            _brandd = location;
                          });
                        },
                        child: new Text(location.title),
                        value: location.title,
                      );
                    }).toList(),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Model Name',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _brandd != null
                              ? Container(
                                  child: DropdownButton(
                                  hint: Text('Model-Name'),
                                  value: _modelBrand,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _modelBrand = newValue;
                                    });
                                  },
                                  items: model
                                      .where((element) =>
                                          element.brandId == _brandd.id)
                                      .toList()
                                      .map((mod) {
                                    return DropdownMenuItem(
                                      onTap: () {
                                        setState(() {
                                          _processor = mod.processor;
                                          _ram = mod.ram;
                                          _cameraFront = mod.cameraFront;
                                          _camerBack = mod.camerBack;
                                          _screenSize = mod.screenSize;
                                          _screenResolution =
                                              mod.screenresolution;
                                          _batterylife = mod.batterylife;
                                          _batteryType = mod.batteryType;
                                          _os = mod.os;
                                        });
                                      },
                                      child: new Text(mod.modelName),
                                      value: mod.modelName,
                                    );
                                  }).toList(),
                                ))
                              : Container()
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Processor',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          _processor == null
                              ? Text('')
                              : Text(
                                  _processor,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Ram',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          _ram == null
                              ? Text('')
                              : Text(
                                  _ram,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Camera front',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          _cameraFront == null
                              ? Text('')
                              : Text(
                                  _cameraFront,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Camer Back',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          _camerBack == null
                              ? Text('')
                              : Text(
                                  _camerBack,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Screen Size',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          _screenSize == null
                              ? Text('')
                              : Text(
                                  _screenSize,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Screen Resolution',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          _screenResolution == null
                              ? Text('')
                              : Text(
                                  _screenResolution,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Battery Life',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          _batterylife == null
                              ? Text('')
                              : Text(
                                  _batterylife,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Battery type',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          _batteryType == null
                              ? Text('')
                              : Text(
                                  _batteryType,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 23, bottom: 13),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Operating System',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          _os == null
                              ? Text('')
                              : Text(
                                  _os,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 23),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Storage',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      child: DropdownButton(
                    hint: Text('Brand-Name'),
                    value: _brand,
                    onChanged: (newValue) {
                      setState(() {
                        _brand = newValue;
                      });
                      print(_brand);
                    },
                    items: stock.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location.title),
                        value: location.title,
                      );
                    }).toList(),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 23),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Color',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                      child: DropdownButton(
                    hint: Text('Brand-Name'),
                    value: _brand,
                    onChanged: (newValue) {
                      setState(() {
                        _brand = newValue;
                      });
                      print(_brand);
                    },
                    items: stock.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location.title),
                        value: location.title,
                      );
                    }).toList(),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
