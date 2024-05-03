import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/controller/dashBoardController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _dashBoard();

}

class _dashBoard extends State<DashBoardScreen>{
  var dashController = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: dashController.Screens[dashController.screenIndex],
     bottomNavigationBar: BottomNavigationBar(items: dashController.navItems,
     backgroundColor: Colors.white,
     onTap: (page){
       setState(() {

       });
    dashController.screenIndex = page;
     },

       selectedItemColor:Color.fromRGBO(143, 148, 251, 1),
       selectedIconTheme: const IconThemeData(color:Color.fromRGBO(143, 148, 251, 1), ),
     currentIndex: dashController.screenIndex,
       type: BottomNavigationBarType.fixed,

     ),
   );
  }
}