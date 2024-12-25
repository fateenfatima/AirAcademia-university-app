import 'package:air_academia_app/Homepage/home.dart';
import 'package:air_academia_app/Homepage/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String _errorMessage = '';

  Future<void> _login() async {
    try {
      // Sign in with email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Navigate to HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      String errorMsg;
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            errorMsg = "No user found for this email.";
            break;
          case 'wrong-password':
            errorMsg = "Incorrect password.";
            break;
          case 'invalid-email':
            errorMsg = "The email address is invalid.";
            break;
          default:
            errorMsg = "An error occurred. Please try again.";
        }
      } else {
        errorMsg = "An unexpected error occurred.";
      }

      setState(() {
        _errorMessage = errorMsg;
      });

      // Show SnackBar for error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMsg,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF036AA4), // Full background color
      body: Center(
        child: SingleChildScrollView(
          // Prevent overflow
          child: Container(
            width: 300.0,
            padding: EdgeInsets.all(20.0), // Padding inside the box
            decoration: BoxDecoration(
              color: Colors.white, // Box background color
              borderRadius: BorderRadius.circular(16.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Shadow color
                  blurRadius: 10.0, // Shadow blur
                  offset: Offset(0, 5), // Shadow position
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust size to content
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top text
                Text(
                  'AirAcademia Login',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF036AA4), // Matching theme color
                  ),
                ),
                SizedBox(height: 10.0),
                // Logo
                Image.asset(
                  'assets/logo1.jpg', // Path to your logo
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10.0),
                // Email TextField
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFF036AA4), // Same color as login button
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                  style: TextStyle(color: Colors.white), // Text color
                ),
                SizedBox(height: 10.0),
                // Password TextField
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFF036AA4), // Same color as login button
                    hintStyle: TextStyle(color: Colors.white70),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Text color
                ),
                SizedBox(height: 10.0),
                // Display error message if exists
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 12.0),
                  ),
                SizedBox(height: 20.0),
                // Login button
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF036AA4), // Button color
                    padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 10.0),
                // Sign Up text
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Color(0xFF036AA4), fontSize: 14.0),
                ),
                SizedBox(height: 5.0),
                // Sign Up button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to SignUpPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Contrast button color
                    side: BorderSide(color: Color(0xFF036AA4)), // Border color
                    padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Color(0xFF036AA4), fontSize: 16.0),
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
