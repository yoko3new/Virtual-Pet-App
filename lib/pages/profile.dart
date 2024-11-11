import 'package:flutter/material.dart';


class profilePage extends StatefulWidget {
  profilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<profilePage> {
  // User details (can be replaced with real user data from a database or API)
  String name = "Jane Doe";
  String petName = "Fluffy";
  String phoneNumber = "+123 456 7890";
  String email = "jane.doe@email.com";
  String username = "janedoe123";


  final TextEditingController nameController = TextEditingController();
  final TextEditingController petnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    petnameController.text = petName;
    phoneNumberController.text = phoneNumber;
    emailController.text = email;
    usernameController.text = username;
  }


  void _saveProfile() {
    setState(() {
      name = nameController.text;
      petName = petnameController.text;
      phoneNumber = phoneNumberController.text;
      email = emailController.text;
      username = usernameController.text;
    });

    // Save this data to a backend or database here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile Updated!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 4.0,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'lib/images/profile.jpg',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Name
                      Text('Name:'),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Pet Name
                      Text('Pet Name:'),
                      TextField(
                        controller: petnameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your pet\'s name',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Phone Number
                      Text('Phone Number:'),
                      TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Email
                      Text('Email:'),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Username
                      Text('Username:'),
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Save button
                      ElevatedButton(
                        onPressed: () {
                          _saveProfile();

                          Navigator.pop(context, '/pet_dashboard');
                        },
                        child: Text('Save Changes'),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
