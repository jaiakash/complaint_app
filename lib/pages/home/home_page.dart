import 'package:complaint_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    final User? user = FirebaseAuth.instance.currentUser;

    // Determine if the user signed in via Phone or Google
    String authMethod = user?.phoneNumber != null ? "Phone" : "Google";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
              Navigator.pushNamed(context, '/auth'); // Navigate to login screen
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Display user info based on authentication type
            Text(
              'Signed in via: $authMethod',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            // Show Email (Google) or Phone Number (Phone Auth)
            user?.email != null
                ? Text('Email: ${user?.email}', style: const TextStyle(fontSize: 16))
                : Text('Phone: ${user?.phoneNumber}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
