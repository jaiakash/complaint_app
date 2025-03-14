import 'package:complaint_app/pages/auth/sign_up_page.dart';
import 'package:complaint_app/pages/auth/sign_in_page.dart';
import 'package:complaint_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:complaint_app/services/auth/auth_service.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = false;

  void _toggleAuth() {
    setState(() {
      _isSignIn = !_isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isSignIn
        ? SignInScreen(onSignUpPressed: _toggleAuth)
        : SignUpScreen(onSignInPressed: _toggleAuth);
  }
}

// Auth wrapper to manage auth state
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const AuthScreen();
          }
          return const HomeScreen();
        }
        
        // Show loading screen while checking auth state
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}