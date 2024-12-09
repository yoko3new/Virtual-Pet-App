import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/registration_page.dart';
import 'pages/login_page_2.dart';
import 'pages/pet_selection.dart';
import 'pages/pet_dashboard.dart';
import 'pages/milestones.dart';
import 'pages/pet_checklist.dart';
import 'pages/profile.dart';
import 'pages/pet_quizzes.dart';
import 'pages/support.dart';
import 'pages/achievements.dart';






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
        '/milestones':(context) =>  petMilestones(),
        '/petchecklist':(context) =>  petChecklist(),
        '/profile':(context) =>  profilePage(),
        '/pet_quizzes':(context) =>  petQuizzes(),
        '/support':(context) =>  petSupport(),
        '/achievements':(context) => achievementsPage(hasFedPet: true, hasGroomedPet: true, hasCuddledPet: true,),





      }
    );
  }
}
