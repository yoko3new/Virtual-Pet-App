import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/components/my_textfield.dart';
import 'package:login/components/square_tile.dart';

class LoginPage2 extends StatelessWidget {
  LoginPage2({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.pets,
                size: 100,
              ),

              const SizedBox(height: 50),
// username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'username',
                obscureText: false,
              ),

              const SizedBox(height: 15),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),

              const SizedBox(height: 15),

              //done button
              ElevatedButton(
                child: const Text("Done"),
                onPressed:(){
                  Navigator.pushNamed(context, '/petselection');
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