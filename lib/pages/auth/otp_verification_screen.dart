import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String verificationId; // Receives verificationId from SignUpScreen

  const OTPVerificationScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> with CodeAutoFill {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    startListening(); // Start listening for SMS OTP
  }

  void startListening() async {
    await SmsAutoFill().listenForCode(); // Google’s SMS Retriever API
  }

  @override
void codeUpdated() async {
  String? code = await SmsAutoFill().getAppSignature; // Fetch OTP manually
  if (code != null) {
    setState(() {
      _otpController.text = code;
    });
    _verifyOTP(); // Automatically verify when OTP is received
  }
}


  Future<void> _verifyOTP() async {
    if (_otpController.text.length != 6) {
      Fluttertoast.showToast(msg: "Enter a valid 6-digit OTP");
      return;
    }

    setState(() => _isLoading = true);

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _otpController.text.trim(),
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        Fluttertoast.showToast(msg: "OTP Verified Successfully!");
        Navigator.pushReplacementNamed(context, '/home'); // Navigate to HomeScreen
      } else {
        Fluttertoast.showToast(msg: "Invalid OTP");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "OTP Verification Failed: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter the OTP sent to your phone",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),

            // OTP Auto-Fill Field
            PinFieldAutoFill(
              controller: _otpController,
              codeLength: 6, // Adjust as per your OTP length
              decoration: BoxLooseDecoration(
                strokeColorBuilder: FixedColorBuilder(Colors.blue),
              ),
              onCodeSubmitted: (code) => _verifyOTP(),
              onCodeChanged: (code) {},
            ),
            const SizedBox(height: 16),

            // Verify OTP Button
            ElevatedButton(
              onPressed: _isLoading ? null : _verifyOTP,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
