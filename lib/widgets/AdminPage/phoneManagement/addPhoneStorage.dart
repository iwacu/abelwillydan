import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';

class AddPhoneStorages extends StatefulWidget {
  final String token;

  const AddPhoneStorages({Key key, this.token}) : super(key: key);
  @override
  _AddPhoneStoragesState createState() => _AddPhoneStoragesState();
}

class _AddPhoneStoragesState extends State<AddPhoneStorages> {
  Itms item1 = new Itms(
    index: 1,
     title: "42",
   
  );

  Itms item2 = new Itms(
    index: 2,
    title: "12",
  );
  Itms item3 = new Itms(
    index: 3,
   title: "32",
    
  );
  Itms item4 = new Itms(
    index: 4,
   title: "1",
    
  );
  Itms item5 = new Itms(
    index: 5,
    title: "128",
   
  );
  Itms item6 = new Itms(
    index: 6,
     title: "64",
    
  );
   final _formKey = GlobalKey<FormState>();
 TextEditingController _brandPhonename=TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
     List<Itms> myList = [item1, item2, item3, item4, item5, item6];
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        
        actions: [
              
               IconButton(
                   icon: Icon(LineAwesomeIcons.bell_1), onPressed: null),
             
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              children: [
              
                 SizedBox(height: SizeConfig.heightMultiplier*6,),
                 Center(
                   child: Text('Add Phone Storage',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.textMultiplier * 2.4)),
                 ),
                             SizedBox(height: SizeConfig.heightMultiplier*4,),
                
                  Padding(
                    padding: const EdgeInsets.only(left:4,right:4),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:4,vertical: 4),
                                   height: SizeConfig.heightMultiplier * 20,
                                    decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: neumorpShadow,
                                    color: dri2,
                              ),
                              child:     Padding(
                                padding: EdgeInsets.symmetric(horizontal:4,vertical: 4),
                                child:Form(
                                  key: _formKey,
                                                                  child: Center(
                                    child: TextFormField(
                                         validator: (val) =>
                                                  val.isEmpty ? 'Enter Phone Storages' : null,
                                            controller: _brandPhonename,
                                        decoration: InputDecoration(
                                          labelText: "Phone Storages",
                                          labelStyle: TextStyle(color: Colors.black),
                                          hintText: "Enter Phone Storages",
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
                                  ),
                                ),
                              ),
                            ),
                  )  
                  ,SizedBox(
                    height:  SizeConfig.heightMultiplier*4,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async{
  print(_brandPhonename.text);
            setState(() {
                                          _isLoading = true;
                                        });
                                      if(_formKey.currentState.validate()){
                                        final response=await DatabaseServiceProvider().addPhoneStorage(_brandPhonename.text, widget.token);
                                       print('hhhhhhhhhhhhhhhh${response.statusCode}');
                                         if (response.statusCode == 200) {
                                        print(response.body);
                                        setState(() {
                                          _isLoading = false;
                                        });

                                        Fluttertoast.showToast(
                                          msg: "Phone Storage Added sucessfully",
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
                                    height: 60,
                                    width: width / 1.5,
                                     decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: neumorpShadow,
                                      color: Colors.white38,
                                ),
                                    child: Center(
                                      child: Text("Add Storage",
                                          style: const TextStyle(
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20.0)),
                                    ),
                                  ),
                    ),
                  )
                 , SizedBox(
                    height:  SizeConfig.heightMultiplier*4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Text('List of available Phone Storages',
                                  style: TextStyle(
                                    fontSize: SizeConfig.textMultiplier * 3.5,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black38,
                                  )),
                  ),
                                 SizedBox(
                    height:  SizeConfig.heightMultiplier*1,
                  ),
                  ListView.builder(
                        shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                 itemCount: myList.length,
                    itemBuilder:(context,index){
                      return Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Row(
                                children: [
                                  Container(
                                    height: SizeConfig.heightMultiplier*4,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                       boxShadow: neumorpShadow,
                                        color: Color(0xFFCADCED),
                                    ),
                                    child: Icon(LineAwesomeIcons.mobile_phone,color: skyBlue,),
                                  ),
                                   SizedBox(
                                    width: SizeConfig.widthMultiplier * 3,
                                  ),
                                  Text('${myList[index].title} ',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black38,
                                          fontSize: SizeConfig.textMultiplier * 2.2)),
                                  Text(' GB',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black38,
                                          fontSize: SizeConfig.textMultiplier * 2.2)),
                                 
                                  
                                ],
                              ),
                      );
                    } ),
                   
              ],
            ),),
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
    Itms(
      {this.index,
      this.title,
     });
}