import 'package:authvwex/emailvalidtion/login.dart';
import 'package:authvwex/emailvalidtion/register.dart';
import 'package:authvwex/emailvalidtion/welcomepage.dart';
import 'package:authvwex/screens/home.dart';
import 'package:authvwex/screens/phone.dart';
import 'package:authvwex/screens/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  runApp(GetMaterialApp(
    initialRoute: 'welcomepage',
    debugShowCheckedModeBanner: false,
  
    routes: {

      'welcomepage':(context) => WelcomePage(),
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home':(context) => home(),
      'login':(context) => Login(),
      'register':(context) => Signup(),
      

    },
  ));
}