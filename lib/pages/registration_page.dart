import 'package:flutter/material.dart';
import 'package:login/components/my_textfield.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});


  // text editing controllers
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phonenumberController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              // welcome back, you've been missed!
              Text(
                'Registration',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 50),

              // first name textfield
              MyTextField(
                controller: firstnameController,
                hintText: 'First name',
                obscureText: false,
              ),

              const SizedBox(height: 15),


              // last name textfield
              MyTextField(
                controller: lastnameController,
                hintText: 'Last name',
                obscureText: false,
              ),

              const SizedBox(height: 15),


              // phone number textfield
              MyTextField(
                controller: phonenumberController,
                hintText: 'Phone number',
                obscureText: false,
              ),

              const SizedBox(height: 15),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 15),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 15),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 15),



              // done button

              ElevatedButton(
                child: const Text("Done"),
                onPressed:(){
                  Navigator.pushNamed(context, '/login2');
                },
              ),
      const SizedBox(height: 50),




            ],
          ),
        ),
      ),
    );
  }
}
