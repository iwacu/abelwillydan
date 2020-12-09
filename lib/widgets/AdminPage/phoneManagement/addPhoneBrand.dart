import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';

class AddPhoneBrand extends StatefulWidget {
  final String token;

  const AddPhoneBrand({Key key, this.token}) : super(key: key);
  @override
  _AddPhoneBrandState createState() => _AddPhoneBrandState();
}

class _AddPhoneBrandState extends State<AddPhoneBrand> {
  Itms item1 = new Itms(
    index: 1,
     title: "Iphone",
   
  );

  Itms item2 = new Itms(
    index: 2,
    title: "Samsung",
  );
  Itms item3 = new Itms(
    index: 3,
   title: "Huawei",
    
  );
  Itms item4 = new Itms(
    index: 4,
   title: "Tecno",
    
  );
  Itms item5 = new Itms(
    index: 5,
    title: "Infinix",
   
  );
  Itms item6 = new Itms(
    index: 6,
     title: "Nokia",
    
  );
  @override
  Widget build(BuildContext context) {
     List<Itms> myList = [item1, item2, item3, item4, item5, item6];
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
             padding: const EdgeInsets.only(right:12),
             child: IconButton(icon: Icon(LineAwesomeIcons.arrow_left,color: Colors.black,), onPressed: (){
               Navigator.pop(context);
             }),
           ),
             SizedBox(height: SizeConfig.heightMultiplier*6,),
             Center(
               child: Text('Add Phone Brand',
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
                            child: Center(
                              child: TextFormField(
                                   validator: (val) =>
                                            val.isEmpty ? 'Enter Phone Brand Name' : null,
                                      // controller: _shopdisctrict,
                                  decoration: InputDecoration(
                                    labelText: "Phone Brand Name",
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: "Enter Phone Brand Name",
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
              )  
              ,SizedBox(
                height:  SizeConfig.heightMultiplier*4,
              ),
              Center(
                child: Container(
                              height: 60,
                              width: width / 1.5,
                               decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: neumorpShadow,
                                color: Colors.white38,
                          ),
                              child: Center(
                                child: Text("Add",
                                    style: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0)),
                              ),
                            ),
              )
             , SizedBox(
                height:  SizeConfig.heightMultiplier*4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Text('List of available Brands',
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
              Expanded(
                child:ListView.builder(
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
                                Text('${myList[index].title}',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black38,
                                        fontSize: SizeConfig.textMultiplier * 2.2)),
                               
                                
                              ],
                            ),
                    );
                  } )),
          ],
        ),),
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