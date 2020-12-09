import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';

class AddingShop extends StatefulWidget {
  final String token;
  const AddingShop({
    Key key,this.token
  }) : super(key: key);

  @override
  _AddingShopState createState() => _AddingShopState();
}

class _AddingShopState extends State<AddingShop> {
  TextEditingController _shopname=TextEditingController();
  TextEditingController _shopnumber=TextEditingController();
  TextEditingController _shopsector=TextEditingController();
  TextEditingController _shopdisctrict=TextEditingController();
   final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    backgroundColor: Colors.white,
         title: Center(
           child: Text('Add Shop',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: SizeConfig.textMultiplier * 2.5,
                )),
         ),
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: ListView(
                    children: [
                      Form(
                         key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 6,
                            ),
                            Text(
                                'Please fill according to the exmple inside the textfield format',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: SizeConfig.textMultiplier * 2.4,
                                )),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 6,
                            ),
                            TextFormField(
                                validator: (val) =>
                                        val.isEmpty ? 'shop name' : null,
                              controller: _shopname,
                              decoration: InputDecoration(
                                labelText: "shop name",
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: "Enter shop name",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                suffixIcon: Icon(
                                  LineAwesomeIcons.plus_square,
                                  color: Colors.black38,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(color: Colors.grey[500]),
                                    gapPadding: 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(color: Colors.grey[500]),
                                    gapPadding: 10),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            TextFormField(
                                validator: (val) =>
                                        val.isEmpty ? 'shop Number' : null,
                            controller: _shopnumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "shop number",
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: "Enter shop number",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                suffixIcon: Icon(
                                  LineAwesomeIcons.plus_square,
                                  color: Colors.black38,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(color: Colors.grey[500]),
                                    gapPadding: 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(color: Colors.grey[500]),
                                    gapPadding: 10),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            TextFormField(
                                validator: (val) =>
                                        val.isEmpty ? 'shop Sector' : null,
                               controller: _shopsector,
                              decoration: InputDecoration(
                                labelText: "shop Sector",
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: "Enter shop Sector",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                suffixIcon: Icon(
                                  LineAwesomeIcons.plus_square,
                                  color: Colors.black38,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(color: Colors.grey[500]),
                                    gapPadding: 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(color: Colors.grey[500]),
                                    gapPadding: 10),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 2,
                            ),
                            TextFormField(
                               validator: (val) =>
                                        val.isEmpty ? 'shop district' : null,
                                   controller: _shopdisctrict,
                              decoration: InputDecoration(
                                labelText: "shop district",
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: "Enter district",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                suffixIcon: Icon(
                                  LineAwesomeIcons.plus_square,
                                  color: Colors.black38,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(color: Colors.grey[500]),
                                    gapPadding: 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide(color: Colors.grey[500]),
                                    gapPadding: 10),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 12,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: SizeConfig.heightMultiplier * 8,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                    color: Color(0xffe5edfe),
                                onPressed: () async{
                                   setState(() {
                                      _isLoading = true;
                                    });
                                  if(_formKey.currentState.validate()){
                                    print('${_shopname.text},${_shopnumber.text},${_shopsector.text},${_shopdisctrict.text},${widget.token}');
                                        final response=await DatabaseServiceProvider().registerShop(_shopname.text, _shopnumber.text, _shopsector.text, _shopdisctrict.text, widget.token);
                                    print('hhhhhhhhhhhhhhhh${response.statusCode}');
                                     if (response.statusCode == 200) {
                                    print(response.body);
                                    setState(() {
                                      _isLoading = false;
                                    });

                                    Fluttertoast.showToast(
                                      msg: "Shop Registered sucessfully",
                                    );
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  } else {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    Fluttertoast.showToast(
                                      msg: "A problem occured contact super_Admin",
                                    );
                                  }
                                     }
                              
                                },
                                child: Text('Confirm',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: SizeConfig.textMultiplier * 2.4)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        _isLoading
                  ? Loading()
                  : Container()
          ],
        ));
  }
}
