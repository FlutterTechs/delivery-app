
import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/screens/profileScreen/resetPassword.dart';
import 'package:deliverymaster/service/FirebaseService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/insigthButton.dart';
class ProfileScreen extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _profileScreen();
}

class _profileScreen extends State<ProfileScreen> {
  var data;

  @override
  Widget build(BuildContext context) {
   var authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor:  Color.fromRGBO(143, 148, 251, 1),
            body:/* StreamBuilder(
                stream: FirebaseServices.getUserData(auth.currentUser!.uid),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    data = snapshot.data!.docs[0];
                    print("data");
                    print(data['name']);
                    return */
                     Obx(
                         () => SafeArea(
                        child: authController.UserName.value == "" ? Center(child: CircularProgressIndicator(),) : Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            children: [
                              50.heightBox,
                              ListTile(
                                leading:
                                    CircleAvatar(backgroundColor: Colors.redAccent,child: Icon(Icons.person),),
                              /*  data["imageUrl"] == "" && editContoller.profileImagePath.isEmpty
                                    ? Image.asset(imgProfile2,width: 70,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                                    : data["imageUrl"] != null && editContoller.profileImagePath.isEmpty
                                    ? Image.network(data["imageUrl"],width: 70,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                                    :Image.file(File(editContoller.profileImagePath.value),width: 70,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),*/
                                title:   Text(authController.UserName.value),         //"${data['name']}".text.white.size(15).make(),
                                subtitle:   Text(authController.Email.value),        // "${data['email']}".text.white.size(12).make(),
                                trailing: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: Colors.white
                                        )
                                    ),
                                    onPressed: () {
                                      authController.logOut();
                                    }, child: "LogOut".text.white.make()),
                              ),

                              20.heightBox,

                              //         height: context.screenHeight / 11,
                              //          width: context.screenWidth / 3.5,
                              FutureBuilder(
                                  future: FirebaseService.getCount(),
                                  builder: (BuildContext context,AsyncSnapshot snapshot){
                                    if(!snapshot.hasData){
                                      return const CircularProgressIndicator();
                                    }else{
                                      var count = snapshot.data;
                                      return
                                       Row(
                                          children: [
                                            insightsButton(title:"Seler Orders",
                                              value: count[0].toString(),
                                              width: context.screenWidth / 3.5,
                                              height: context.screenHeight / 9,),
                                            insightsButton(title: "Hub order",
                                              value: count[1].toString(),
                                              width: context.screenWidth / 3.5,
                                              height: context.screenHeight / 9,),
                                            insightsButton(title: "Delivered",
                                              value: count[2].toString(),
                                              width: context.screenWidth / 3.5,
                                              height: context.screenHeight / 9,),
                                          ]
                                      );

                                   }
                                  }),

                              20.heightBox,
                              Column(
                                children: [
                                  ListTile(
                                    title: "Notification".text.make(),
                                    leading: Icon(Icons.notifications),
                                    onTap: (){},
                                  ),
                                  Divider(),

                                  ListTile(
                                    title: "My Earnings".text.make(),
                                    leading: Icon(Icons.money),
                                    onTap: (){
                                 //     Get.to(()=>ProfileChatScreen());
                                    },
                                  ),
                                  Divider(),
                                  ListTile(
                                    title: "Reset Password".text.make(),
                                    leading: Icon(Icons.key),
                                    onTap: (){
                                      Get.to(()=>ResetPasswordScreen(authController.password.value,authController.Email.value));
                                    },
                                  ),
                                  Divider(),
                                  ListTile(
                                    title: "Terms and Conditions".text.make(),
                                    leading: Icon(Icons.policy),
                                    onTap: (){
                                    //  Get.to(()=>TermsAndConditionScreen());
                                    },
                                  ),
                                ],
                              ).box.white.p12.shadow.roundedSM.width(context.screenWidth - 60).make()
                            ],
                          ),
                        ),
                       ),
                     )
                    );

                /*  } else {
                    return Center(child: CircularProgressIndicator(),);
                  }
                })
        );*/

  }


}
