import 'package:flutter/material.dart';


class profilePage extends StatefulWidget {
  profilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<profilePage> {
  // User details (can be replaced with real user data from a database or API)
  String _userName = "Jane Doe";
  String _petName = "Fluffy";
  String _phoneNumber = "+123 456 7890";
  String _email = "jane.doe@email.com";
  String _username = "janedoe123";


  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userNameController.text = _userName;
    _petNameController.text = _petName;
    _phoneNumberController.text = _phoneNumber;
    _emailController.text = _email;
    _usernameController.text = _username;
  }


  // Function to save updated details (For now, we'll just print the values)
  void _saveProfile() {
    setState(() {
      _userName = _userNameController.text;
      _petName = _petNameController.text;
      _phoneNumber = _phoneNumberController.text;
      _email = _emailController.text;
      _username = _usernameController.text;
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
                        controller: _userNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Pet Name
                      Text('Pet Name:'),
                      TextField(
                        controller: _petNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your pet\'s name',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Phone Number
                      Text('Phone Number:'),
                      TextField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Email
                      Text('Email:'),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Username
                      Text('Username:'),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Save button
                      ElevatedButton(
                        onPressed: () {
                          _saveProfile();  // Save the profile first

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
