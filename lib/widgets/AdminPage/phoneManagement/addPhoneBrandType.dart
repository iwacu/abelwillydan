import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';

class AddPhoneBrandType extends StatefulWidget {
  final String token;

  const AddPhoneBrandType({Key key, this.token}) : super(key: key);
  @override
  _AddPhoneBrandTypeState createState() => _AddPhoneBrandTypeState();
}

class _AddPhoneBrandTypeState extends State<AddPhoneBrandType> {
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
               child: Text('Add Phone Brand Type',
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
                               height: SizeConfig.heightMultiplier * 24,
                                decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: neumorpShadow,
                                color: dri2,
                          ),
                          child:     Padding(
                            padding: EdgeInsets.symmetric(horizontal:4,vertical: 4),
                            child: Column(
                              children: [
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
                              ],
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
                                Text('Brand: ',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black38,
                                        fontSize: SizeConfig.textMultiplier * 2.2)),
                                Text('${myList[index].title}',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: SizeConfig.textMultiplier * 2.2)),
                               SizedBox(width: SizeConfig.widthMultiplier*4,),
                                Text('Model: ',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black38,
                                        fontSize: SizeConfig.textMultiplier * 2.2)),
                                Text('${myList[index].model}',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
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
  String model;
    Itms(
      {this.index,
      this.title,
      this.model,
     });
}