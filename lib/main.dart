import 'package:flutter/material.dart';
//package:shared_preferences/shared_preferences.dart


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.white , 
        child: Container(
          color: Colors.blue,),),
    );
  
  }
}