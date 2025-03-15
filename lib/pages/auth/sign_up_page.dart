import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:complaint_app/services/auth/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  final Function() onSignInPressed;

  const SignUpScreen({super.key, required this.onSignInPressed});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool _isLoading = false;
  bool _otpSent = false;
  String? _verificationId;



  // 🔹 Send OTP for Phone Authentication
  Future<void> _sendOTP() async {
    String phoneNumber = "+91${_phoneController.text.trim()}"; // Adjust country code if needed
    setState(() => _isLoading = true);

    await _authService.sendOTP(phoneNumber, (String verificationId, int? resendToken) {
      setState(() {
        _verificationId = verificationId;
        _otpSent = true;
        _isLoading = false;
      });
      Fluttertoast.showToast(msg: "OTP Sent!");
    });
  }

  // 🔹 Verify OTP
  Future<void> _verifyOTP() async {
    if (_verificationId == null) return;
    setState(() => _isLoading = true);

    final userCredential = await _authService.verifyOTP(
      _verificationId!,
      _otpController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (userCredential != null && mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Fluttertoast.showToast(msg: "Invalid OTP");
    }
  }


  //sign up with google
  Future<void> _signUpWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    // Call signInWithGoogle and await the result
    final userCredential = await _authService.signInWithGoogle();

    setState(() {
      _isLoading = false;
    });

    // If sign-up is successful (non-null UserCredential)
    if (userCredential != null) {
      // Navigate to home screen
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      // Show error message
      Fluttertoast.showToast(
          msg: 'Failed to sign up with Google',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Let\'s get started!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 36, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),

                Text(
                  'We\'re excited to have you join our community!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 30),



                // 🔹 Phone Number Input
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // 🔹 Send OTP Button / OTP Input Field
                _otpSent
                    ? TextField(
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Enter OTP',
                          border: OutlineInputBorder(),
                        ),
                      )
                    : OutlinedButton(
                        onPressed: _isLoading ? null : _sendOTP,
                        child: const Text('Send OTP'),
                      ),
                const SizedBox(height: 16),

                // 🔹 Verify OTP Button
                _otpSent
                    ? ElevatedButton(
                        onPressed: _isLoading ? null : _verifyOTP,
                        child: _isLoading ? const CircularProgressIndicator() : const Text('Verify OTP'),
                      )
                    : const SizedBox(),

                const SizedBox(height: 16),
                const Text('Or', textAlign: TextAlign.center),
                const SizedBox(height: 16),


                // Google sign-up button
                OutlinedButton.icon(
                  onPressed: _isLoading ? null : _signUpWithGoogle,
                  icon: const Icon(FontAwesomeIcons.google, color: Colors.red),
                  label: const Text('Sign up with Google'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                const SizedBox(height: 24),

                // Sign in link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: widget.onSignInPressed,
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
