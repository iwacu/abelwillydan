import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/stockManagementresponse.dart';
import 'package:phonestockmgt/models/userdetails.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';

class AddPhoneBrandTypeSpecifications extends StatefulWidget {
  final String token;
  final List<AllBrands> allBrands;
  final List<AllColors> allColors;
  final List<AllStorage> allStorages;
 final UserDetails user;
  const AddPhoneBrandTypeSpecifications(
      {Key key, this.token, this.allBrands, this.allColors, this.allStorages, this.user})
      : super(key: key);
  @override
  _AddPhoneBrandTypeSpecificationsState createState() =>
      _AddPhoneBrandTypeSpecificationsState();
}

class _AddPhoneBrandTypeSpecificationsState
    extends State<AddPhoneBrandTypeSpecifications> {
  TextEditingController _phoneModel = TextEditingController();
  TextEditingController _phonePocessor = TextEditingController();
  TextEditingController _phoneRam = TextEditingController();
  TextEditingController _phoneCMFRT = TextEditingController();
  TextEditingController _phoneCBK = TextEditingController();
  TextEditingController _phoneSCRNZ = TextEditingController();
  TextEditingController _phoneResolution = TextEditingController();
  TextEditingController _phoneBTRYLF = TextEditingController();
  TextEditingController _phoneBTRYTYPE = TextEditingController();
  TextEditingController _phoneOS = TextEditingController();
 String _selectedType;
  int _selectedindex;
  int _selectedindexpk;
  bool _isLoading=false;
   final _formKey = GlobalKey<FormState>();
  Itms item1 = new Itms(
    index: 1,
    title: "Iphone",
  );

  Itms item2 = new Itms(index: 2, title: "Samsung", model: "6");
  Itms item3 = new Itms(index: 3, title: "Huawei", model: "pi3");
  Itms item4 = new Itms(index: 4, title: "Tecno", model: "C7");
  Itms item5 = new Itms(index: 5, title: "Infinix", model: "hot9");
  Itms item6 = new Itms(index: 6, title: "Nokia", model: "6");
  List<String> brands = ['iphone', 'samsung', 'tecno', 'huwaei'];
  List<String> type = ['6', 'hot9', '9', '10'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('Add Phone Brand Type',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.textMultiplier * 2.4)),
        actions: [
          GestureDetector(
            onTap: ()async{
               setState(() {
                                          _isLoading = true;
                                        });
                                         if(_formKey.currentState.validate()){
                                          final response=await DatabaseServiceProvider().addPhoneModelSpecifications(
                                           2,
                                            _selectedindexpk, _selectedindex, widget.token, _phoneModel.text, 
                                            _phonePocessor.text, _phoneRam.text,
                                            _phoneCMFRT.text, _phoneCBK.text,
                                            _phoneSCRNZ.text, _phoneResolution.text,
                                            _phoneBTRYLF.text, _phoneBTRYTYPE.text, _phoneOS.text);
                                             print('hhhhhhhhhhhhhhhh${response.statusCode}');
                                         if (response.statusCode == 200) {
                                        print(response.body);
                                        setState(() {
                                          _isLoading = false;
                                        });

                                        Fluttertoast.showToast(
                                          msg: "Completed sucessfully",
                                        );
                                        Navigator.pop(context);
                                       // Navigator.pop(context);
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
                      child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 2,
                  vertical: SizeConfig.heightMultiplier * 2),
              // height: 60,
              // width: width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: neumorpShadow,
                color: Colors.white38,
                border: Border.all(color: Colors.blueGrey),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Center(
                  child: Text("Add",
                      style: const TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 12)),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Form(
                    key: _formKey,
                          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Choose Brand',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                          DropdownButton(
                            hint: Text(
                              'Select Brand',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.orangeAccent,
                              ),
                            ),
                            value: _selectedType,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedType = newValue;
                                            });
                                           
                                          },
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                            items: widget.allBrands.map(
                              (val) {
                                return DropdownMenuItem<String>(
                                   onTap: () {
                                                  setState(() {
                                                    _selectedType = val.fields.brandName;
                                                    _selectedindex=  val.fields.phoneType;
                                                    _selectedindexpk= val.primaryKey;
                                                  });
                                                   print(_selectedType);
                                                 },
                                  child: Text(val.fields.brandName),
                                  value: val.fields.brandName,
                                );
                              },
                            ).toList(),
                          
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter Phone Model' : null,
                         controller:_phoneModel,
                        decoration: InputDecoration(
                          labelText: "Phone Model",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Model",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter Phone Processor' : null,
                         controller: _phonePocessor,
                        decoration: InputDecoration(
                          labelText: "Phone Processor",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Processor",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter Phone Ram' : null,
                      controller: _phoneRam,
                        decoration: InputDecoration(
                          labelText: "Phone Ram",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Ram",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter Phone Camera_Front' : null,
                         controller: _phoneCMFRT,
                        decoration: InputDecoration(
                          labelText: "Phone Camera_Front",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Camera_Front",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter Phone Camera_Back' : null,
                         controller: _phoneCBK,
                        decoration: InputDecoration(
                          labelText: "Phone Camera_Back",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Camera_Back",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter Phone Screen_Size' : null,
                        controller: _phoneSCRNZ,
                        decoration: InputDecoration(
                          labelText: "Phone Screen_Size",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Screen_Size",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter Phone Screen_Resolution' : null,
                         controller: _phoneResolution,
                        decoration: InputDecoration(
                          labelText: "Phone Screen_Resolution",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Screen_Resolution",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter Phone Battery_Life' : null,
                         controller: _phoneBTRYLF,
                        decoration: InputDecoration(
                          labelText: "Phone Battery_Life",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Battery_Life",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter Phone Battery_Type' : null,
                         controller: _phoneBTRYTYPE,
                        decoration: InputDecoration(
                          labelText: "Phone Battery_Type",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Battery_Type",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Center(
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter Phone Operating_System' : null,
                       controller: _phoneOS,
                        decoration: InputDecoration(
                          labelText: "Phone Operating_System",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Phone Operating_System",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(
                            LineAwesomeIcons.plus_square,
                            color: Colors.black38,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
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
      ),
    );
  }
}

class Itms {
  int index;
  String title;
  String model;
  Itms({
    this.index,
    this.title,
    this.model,
  });
}
