import 'dart:async';
import 'package:appnew/Models/NewsModel.dart';
import 'package:appnew/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:appnew/api-helper/api_helper.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
static String id ='splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.popAndPushNamed(context,HomeScreen.id);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: 


         Center(
          child: Image.asset('assets/photo1625584911.jpeg',),
        ),

    );
  }
}

