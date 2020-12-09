import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/widgets/Settings/myprofile/myprofile.dart';
import 'package:phonestockmgt/widgets/homepage/myHomePageH.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController =PageController();
  int _selectedIndex =0;
  List<Widget> _screens=[
    HomePageTesting(),MyProfile()
  ];
   void _onPageChanged(int index){
     setState(() {
       _selectedIndex=index;
     });
   }
   void _itemTaped(int selectedIndex){
     _pageController.jumpToPage(selectedIndex);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
              child: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: _selectedIndex ,
       selectedFontSize: 16,
       onTap: _itemTaped,
       items: [
        BottomNavigationBarItem(
          icon: Icon(LineAwesomeIcons.home,color:_selectedIndex ==0? skyBlue:Colors.black38,),title: Text('Home',style: TextStyle(color:_selectedIndex ==0? Colors.black:Colors.black38),)),
        BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.user,color:_selectedIndex ==1? skyBlue:Colors.black38,),title: Text('My Account',style: TextStyle(color:_selectedIndex ==1? Colors.black:Colors.black38),))
     
      ],),
     
       );
  }
}