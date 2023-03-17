import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("home"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back,
            color: Colors.black,)),
      ),
      body: Container(
        child: 
        Image.asset("assets/image/login.png"),
        
      ),
    );
  }
}
