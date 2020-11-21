import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/testingmodels.dart';


class OutStock extends StatefulWidget {
  @override
  _OutStockState createState() => _OutStockState();
}

List<StockItem> model = [
  StockItem(
      id: 1,
      imei: '359396071068943',
      brandName: 'Iphone',
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
      os: 'IOS',
      color: 'black',
      storage: '34'),
  StockItem(
      id: 2,
      imei: '359396071068950',
      brandName: 'Iphone',
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
      os: 'IOS',
      color: 'pink',
      storage: '128'),
  StockItem(
      id: 3,
      imei: '359396071068957',
      brandName: 'Samsung',
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
      os: 'Android',
      color: 'Gold',
      storage: '36'),
  StockItem(
      id: 4,
      imei: '359396071068964',
      brandName: 'Samsung',
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
      os: 'Android',
      color: 'white',
      storage: '256'),
];

class _OutStockState extends State<OutStock> {
  String _barcode = '';
  TextEditingController _barcodeText = TextEditingController();
  StockItem _oneItem;
  List<StockItem> _itemSearched = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.refresh, color: Colors.black),
                    iconSize: SizeConfig.imageSizeMultiplier * 8,
                    onPressed: () {
                      setState(() {
                        _itemSearched=[];
                      });
                    }),
                Container(
                  height: SizeConfig.heightMultiplier * 8,
                  width: SizeConfig.widthMultiplier * 20,
                  decoration: BoxDecoration(
                      color: yellowColor, borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text('Confirm',
                          style: TextStyle(color: Colors.indigo[100]))),
                ),
              ],
            ),
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "out-Stock",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    'BarCode',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                                  InkWell(
                            onTap: () async {
                              try {
                                String _barcode = await BarcodeScanner.scan();
                                setState(() {
                                  this._barcode = _barcode;
                                  _oneItem = model
                                      .where((element) => element.imei == _barcode)
                                      .single;
                                  _itemSearched.add(_oneItem);
                                  
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
                                child: Image.asset('assets/images/barcodeScanner.png'))),
          
                          Container( width: SizeConfig.widthMultiplier * 62,
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
                            onTap: () async{
                               
                          setState(() {
                             _oneItem =  model
                                      .where((element) => element.imei == _barcodeText.text)
                                      .single;
                                  _itemSearched.add(_oneItem);
                                  _barcodeText.clear();
                          });
                            },
                            child: Container(
                              height: SizeConfig.heightMultiplier*4,
                              width: SizeConfig.widthMultiplier*12,
                              decoration: BoxDecoration(
                                color: dshbrd,
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              child: Center(child: Text('Add',style: TextStyle(color: Colors.indigo[100]),)),
                            ),
                          ),
                       
                    ],
                  ),
                ),
               
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          _itemSearched != null
              ? Expanded(
                              child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _itemSearched.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: ExpansionTile(
                            title: Text(_itemSearched[index].imei),
                            leading: Text('${(index + 1).toString()} .'),
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 23),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Brand Model Name',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          '${_itemSearched[index].brandName} ${_itemSearched[index].modelName}',
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
                                        left: 8, right: 8, top: 23),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Ram',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          _itemSearched[index].ram,
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
                                        left: 8, right: 8, top: 23),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Color',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          _itemSearched[index].color,
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
                                        left: 8, right: 8, top: 23),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Storage',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          _itemSearched[index].storage,
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
                                        left: 8, right: 8, top: 23),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Screen Size',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          _itemSearched[index].screenSize,
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
                                        left: 8, right: 8, top: 23),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Screen Resolution',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          _itemSearched[index].screenresolution,
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
                                        left: 8, right: 8, top: 23),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Camera front',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          _itemSearched[index].cameraFront,
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
                                        left: 8, right: 8, top: 23),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Battery life',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          _itemSearched[index].batterylife,
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
                            ],
                          ),
                        ),
                      );
                    }),
              )
              : Container()
        ],
      ),
    );
  }
}