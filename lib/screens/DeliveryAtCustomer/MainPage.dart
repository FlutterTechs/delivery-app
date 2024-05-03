import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/controller/dashBoardController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _mainPage();

}

class _mainPage extends State<MainPage>{
  var dashController = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dashController.DeliveryScreens[dashController.pageIndex],
      bottomNavigationBar: BottomNavigationBar(items: dashController.navItems,
        backgroundColor: Colors.white,
        onTap: (page){
          setState(() {

          });
          dashController.pageIndex = page;
        },

        selectedItemColor:Color.fromRGBO(143, 148, 251, 1),
        selectedIconTheme: const IconThemeData(color:Color.fromRGBO(143, 148, 251, 1), ),
        currentIndex: dashController.pageIndex,
        type: BottomNavigationBarType.fixed,

      ),
    );
  }
}