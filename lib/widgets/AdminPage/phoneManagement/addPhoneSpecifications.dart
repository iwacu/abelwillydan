import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';

class AddPhoneBrandTypeSpecifications extends StatefulWidget {
  final String token;

  const AddPhoneBrandTypeSpecifications({Key key, this.token}) : super(key: key);
  @override
  _AddPhoneBrandTypeSpecificationsState createState() => _AddPhoneBrandTypeSpecificationsState();
}

class _AddPhoneBrandTypeSpecificationsState extends State<AddPhoneBrandTypeSpecifications> {
  Itms item1 = new Itms(
    index: 1,
    title: "Iphone",
   
  );

  Itms item2 = new Itms(
    index: 2,
    title: "Samsung",
    model: "6"
    
  );
  Itms item3 = new Itms(
    index: 3,
    title: "Huawei",
    model: "pi3"
  );
  Itms item4 = new Itms(
    index: 4,
    title: "Tecno",
    model: "C7"
  );
  Itms item5 = new Itms(
    index: 5,
    title: "Infinix",
   model: "hot9"
  );
  Itms item6 = new Itms(
    index: 6,
    title: "Nokia",
    model: "6"
    
  );
  List<String> brands=['iphone','samsung','tecno','huwaei'];
  List<String> type=['6','hot9','9','10'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title:  Text('Add Phone Brand Type',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.textMultiplier * 2.4)),
        actions: [
      
          Container(
               margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2,vertical:SizeConfig.heightMultiplier*2 ),
                         // height: 60,
                         // width: width / 1.5,
                           decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: neumorpShadow,
                            color: Colors.white38,
                            border:Border.all(
                              color: Colors.blueGrey
                            ),
                      ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8.0),
                            child: Center(
                              child: Text("Add",
                                  style: const TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize:12)),
                            ),
                          ),
                        ),
        ],
      
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left:8.0,right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: SizeConfig.heightMultiplier*4,),
              
                                 Padding(
                                              padding: const EdgeInsets.only(left: 8, right: 8),
                                              child: 
                                              Row(
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
                                          '.........',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.orangeAccent,
                                          ),
                                        ),
                                     
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                  items: brands.map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                       
                                        child: Text(val),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (val) {
                                    
                                  },
                      )
                    ],
                                              ),
                                        
                                          ),
                                  Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                                    'Choose Phone Brand Type',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                    ),
                      ),
                      
                      DropdownButton(
                                    hint: Text(
                                            '.........',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.orangeAccent,
                                            ),
                                          ),
                                       
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                    ),
                                    items: brands.map(
                                      (val) {
                                        return DropdownMenuItem<String>(
                                         
                                          child: Text(val),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (val) {
                                      
                                    },
                      )
                    ],
                                              ),
                                  ),
                                    
                                           SizedBox(height: SizeConfig.heightMultiplier*3,),
                     Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Processor' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Processor",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Processor",
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
                                           SizedBox(height: SizeConfig.heightMultiplier*3,),
                      Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Ram' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Ram",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Ram",
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
                                              SizedBox(height: SizeConfig.heightMultiplier*3,),
                      Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Camera_Front' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Camera_Front",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Camera_Front",
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
                                              SizedBox(height: SizeConfig.heightMultiplier*3,),
                      Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Camera_Back' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Camera_Back",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Camera_Back",
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
                                              SizedBox(height: SizeConfig.heightMultiplier*3,),
                      Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Screen_Size' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Screen_Size",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Screen_Size",
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
                                               SizedBox(height: SizeConfig.heightMultiplier*3,),
                      Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Screen_Resolution' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Screen_Resolution",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Screen_Resolution",
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
                                               SizedBox(height: SizeConfig.heightMultiplier*3,),
                      Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Screen_Size' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Screen_Size",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Screen_Size",
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
                                              SizedBox(height: SizeConfig.heightMultiplier*3,),
                      Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Battery_Life' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Battery_Life",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Battery_Life",
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
                                              SizedBox(height: SizeConfig.heightMultiplier*3,),
                      Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Battery_Type' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Battery_Type",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Battery_Type",
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
                                           SizedBox(height: SizeConfig.heightMultiplier*3,),
                      Center(
                                  child: TextFormField(
                                       validator: (val) =>
                                                val.isEmpty ? 'Enter Phone Operating_System' : null,
                                          // controller: _shopdisctrict,
                                      decoration: InputDecoration(
                                        labelText: "Phone Operating_System",
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintText: "Enter Phone Operating_System",
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
                 
                             SizedBox(height: SizeConfig.heightMultiplier*4,),
              
                
                SizedBox(
                  height:  SizeConfig.heightMultiplier*4,
                ),
            ],
          ),
        ),),
    );
  }
}

class Itms {
  int index;
  String title;
  String model;
    Itms(
      {this.index,
      this.title,
      this.model,
     });
}