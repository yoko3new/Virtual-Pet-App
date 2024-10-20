import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/registration_page.dart';
import 'pages/login_page_2.dart';
import 'pages/pet_selection.dart';
import 'pages/pet_dashboard.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes:{
        '/loginpage':(context) =>  LoginPage(),
        '/registrationpage':(context) =>  RegistrationPage(),
        '/login2':(context) =>  LoginPage2(),
        '/petselection':(context) =>  petSelection(),
        '/petdashboard':(context) =>  petDashboard(),


      }
    );
  }
}
