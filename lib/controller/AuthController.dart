import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/screens/ChoiceScreen/ChoiceScreen.dart';
import 'package:deliverymaster/screens/login/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AuthController extends GetxController{
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  var EmailCon = TextEditingController();
  var passwordCon = TextEditingController();
  checkUser({email,password}){
    return firestore.collection(deliveryCollection).where("email",isEqualTo: email).get().then((value){
      print(value.docs.length);
      return value.docs.length;
    } );

  }
  login() async{
    if(passwordCon.text.isNotEmpty && EmailCon.text.isNotEmpty){
      if(await checkUser(email: EmailCon.text,password: passwordCon.text) > 0){
        auth.signInWithEmailAndPassword(
            email: EmailCon.text,
            password: passwordCon.text).then((value){
          Get.to(()=>ChoiceScreen());
        }).onError((error, stackTrace) {
          Fluttertoast.showToast(msg: "Incorrect Password or User name");
        });
      }else{
        Fluttertoast.showToast(msg: "User Doesn't exists");
      }
    }else{
      Fluttertoast.showToast(msg: "Please Enter details");
    }
  }

  logOut(){
    try{
      auth.signOut();
      Get.offAll(()=>LoginScreen());
    }catch(e){
      Fluttertoast.showToast(msg: "Failed to logout");
    }
  }
  var UserName = "".obs;
  var Email = "".obs;
  var password = "".obs;
  getUserData() async{
    await firestore.collection(deliveryCollection).doc(currentUser!.uid).get().then((value) {
      if(value != null){
        UserName.value = value.data()?["name"];
        Email.value = value.data()?["email"];
        password.value = value.data()?["password"];
      }
    });


  }


  Future<void> changeAuthPassword({oldPassword,confirmPassword,newPassword}) async{
    if(oldPassword == confirmPassword){
      User? user = FirebaseAuth.instance.currentUser;
      try{
        user!.updatePassword(newPassword);
        await  firestore.collection(deliveryCollection).doc(currentUser!.uid).update({
          "password":newPassword
        });
        print("password Updated sucessfully");
        Get.offAll(()=>LoginScreen());

      }catch(e){
        print("Password Change Error : $e");
      }

    }else{
      Fluttertoast.showToast(msg: "Password Doesn't match");
    }

  }
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      print('Password reset email sent successfully');
      Fluttertoast.showToast(msg: "password reset mail sent");
      Get.offAll(()=>LoginScreen());
    } catch (e) {
      print('Error sending password reset email: $e');
    }
  }




}