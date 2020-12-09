import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/constant/sizeconfig.dart';
import 'package:phonestockmgt/models/apiResponse.dart';
import 'package:phonestockmgt/services/API/apis.dart';
import 'package:phonestockmgt/widgets/LoadingSpinner/loading.dart';

class ShopAssignmentEditing extends StatefulWidget {
  final AssingedShop person;
  final String token;
  final int id;
  final List<AllShopss> positions;

  const ShopAssignmentEditing(
      {Key key, this.person, this.token, this.id, this.positions})
      : super(key: key);

  @override
  _ShopAssignmentEditingState createState() => _ShopAssignmentEditingState();
}

class _ShopAssignmentEditingState extends State<ShopAssignmentEditing> {
  String _dropDownValue = '';
  String _previousPosition = '';
  String _statusdrp = '';
  bool _isLoading = false;
  int _positionId;
  List<String> status = ['active', 'Innactive'];
  @override
  void initState() {
    _statusdrp = widget.person.status;
    _previousPosition = widget.person.shopname == null
        ? 'No Position assigned'
        : widget.person.shopname;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
     //  backgroundColor: Color(0xFFCADCED),
      appBar: AppBar(
         backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Update User Shop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 6),
              Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/no_image.png'),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Center(
                child: Text(
                  '${widget.person.firstname} ${widget.person.lastname}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: SizeConfig.textMultiplier * 2),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Center(
                child: Text(
                  '${widget.person.email}',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: SizeConfig.textMultiplier * 2),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: neumorpShadow,
                              color: Colors.white38,
                        ),
                  child: Column(
                    children: [
                      //previous_position
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Text(
                                'Current Shop',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            widget.person.shopname == null
                                ? Expanded(
                                    child: Text(
                                      '  No Shop assigned',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                  )
                                : Text(
                                    '${widget.person.shopname}',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.orangeAccent,
                                    ),
                                  )
                          ],
                        ),
                      ),

                      //new_shop assignment
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'New Shop',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                                DropdownButton(
                                  hint: _dropDownValue == ''
                                      ? Text(
                                          '.........',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.orangeAccent,
                                          ),
                                        )
                                      : Text(
                                          '$_dropDownValue',
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
                                  items: widget.positions.map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val.fields.shopName,
                                        onTap: () {
                                          setState(() {
                                            _dropDownValue =
                                                val.fields.shopName;
                                            _positionId = val.primaryKey;
                                          });
                                          print(_positionId);
                                        },
                                        child: Text(val.fields.shopName),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        _dropDownValue = val;
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                              ),
                            ),
                            DropdownButton(
                              hint: Text(
                                '$_statusdrp',
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
                              items: status.map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    onTap: () {
                                      setState(() {
                                        _statusdrp = val;
                                      });
                                      print(_positionId);
                                    },
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    _statusdrp = val;
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),

                      widget.person.shopname == null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: GestureDetector(
                                onTap: () async {
                                  if (_positionId == null) {
                                    Fluttertoast.showToast(
                                      msg:
                                          "Please choose a Shop from dropdown menu",
                                    );
                                  } else {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    final response =
                                        await DatabaseServiceProvider()
                                            .assignedShop(
                                                widget.person.positionId,
                                                _positionId,
                                                _statusdrp,
                                                widget.token);
                                    if (response.statusCode == 200) {
                                      print(response.body);
                                      setState(() {
                                        _isLoading = false;
                                      });

                                      Fluttertoast.showToast(
                                        msg: "Shop assigned sucessfully",
                                      );
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    } else {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Fluttertoast.showToast(
                                        msg:
                                            "A problem occured contact super_Admin",
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
                                    child: Text("Assign",
                                        style: const TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0)),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: GestureDetector(
                                onTap: () async {
                                  if (_positionId == null) {
                                    Fluttertoast.showToast(
                                      msg:
                                          "Please choose a Shop from dropdown menu",
                                    );
                                  } else {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    final response =
                                        await DatabaseServiceProvider()
                                            .assignedShopUpdate(
                                               widget.person.id,
                                                widget.person.positionId,
                                                _positionId,
                                                _statusdrp,
                                                widget.token);
                                    if (response.statusCode == 200) {
                                      print(response.body);
                                      setState(() {
                                        _isLoading = false;
                                      });

                                      Fluttertoast.showToast(
                                        msg: "Shop Updated sucessfully",
                                      );
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    } else {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Fluttertoast.showToast(
                                        msg:
                                            "A problem occured contact super_Admin",
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
                                    child: Text("Update",
                                        style: const TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0)),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
          _isLoading ? Loading() : Container()
        ],
      ),
    );
  }
}
