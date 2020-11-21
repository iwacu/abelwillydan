import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:phonestockmgt/constant/colors.dart';
import 'package:phonestockmgt/widgets/Settings/settings.dart';
import 'package:phonestockmgt/widgets/homepage/Myhomepage.dart';
import 'package:phonestockmgt/widgets/stockIn/stockIn.dart';
import 'package:phonestockmgt/widgets/stockout/stockOut.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController =PageController();
  int _selectedIndex =0;
  List<Widget> _screens=[
    Myhomepage(),StockIn(),StockOut(),Settings()
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
          icon: Icon(EvaIcons.home,color:_selectedIndex ==0? yellowColor:Colors.black38,),title: Text('Home',style: TextStyle(color:_selectedIndex ==0? Colors.black:Colors.black38),)),
        BottomNavigationBarItem(icon: Icon(EvaIcons.arrowCircleLeftOutline,color: _selectedIndex ==1? yellowColor:Colors.black38,),title: Text('Stock-In',style: TextStyle(color:_selectedIndex ==1? Colors.black:Colors.black38),)),
        BottomNavigationBarItem(icon: Icon(EvaIcons.arrowCircleRightOutline,color: _selectedIndex ==2? yellowColor:Colors.black38,),title: Text('Stock-out',style: TextStyle(color:_selectedIndex ==2? Colors.black:Colors.black38),)),
        BottomNavigationBarItem(icon: Icon(EvaIcons.personOutline,color:_selectedIndex ==3? yellowColor:Colors.black38,),title: Text('Account',style: TextStyle(color:_selectedIndex ==3? Colors.black:Colors.black38),))
     
      ],),
     
       );
  }
}