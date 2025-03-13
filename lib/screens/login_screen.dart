import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otp_screen.dart'; // Import the OTP screen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();
  final TextEditingController _phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// ✅ Function to send OTP
  void sendOTP() async {
    String phoneNumber = "+91" + _phoneController.text.trim(); // Adjust country code if needed

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Phone number verified automatically!")),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Verification failed: ${e.message}")),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP timeout. Try again.")),
        );
      },
    );
  }

  /// ✅ Function to check if user is logged in
  void checkLoginStatus() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print("User is logged in: ${user.phoneNumber ?? user.displayName}");
    } else {
      print("User is not logged in.");
    }
  }

  /// ✅ Function to sign out
  Future<void> signOut() async {
    await _auth.signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User signed out.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Google Sign-In Button
            ElevatedButton(
              onPressed: () async {
                var user = await authService.signInWithGoogle();
                if (user != null) {
                  print("Logged in as: ${user.displayName}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Welcome ${user.displayName}!")),
                  );
                } else {
                  print("Login failed");
                }
              },
              child: Text("Sign in with Google"),
            ),
            SizedBox(height: 20),

            // ✅ Phone Login Text Field
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Phone Number",
                prefixText: "+91 ",
              ),
            ),
            SizedBox(height: 10),

            // ✅ Send OTP Button
            ElevatedButton(
              onPressed: sendOTP,
              child: Text("Send OTP"),
            ),
            SizedBox(height: 20),

            // ✅ Check Login Status
            ElevatedButton(
              onPressed: checkLoginStatus,
              child: Text("Check Login Status"),
            ),
            SizedBox(height: 20),

            // ✅ Sign Out Button
            ElevatedButton(
              onPressed: signOut,
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
