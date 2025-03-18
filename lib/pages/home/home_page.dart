import 'package:complaint_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;
    final AuthService _authService = AuthService();

    // Get user details
    String displayName = user?.displayName ?? "No username";
    String email = user?.email ?? "No email";
    String phoneNumber = user?.phoneNumber ?? "No phone number";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
              Navigator.pushNamed(context, '/auth');
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
            // Show email & name for Google users, otherwise show phone number
            if (user != null) ...[
              if (user.email != null && user.email!.isNotEmpty)
                Text('Username: $displayName', style: const TextStyle(fontSize: 16)),

              if (user.displayName != null && user.displayName!.isNotEmpty)
                Text('Email: $email', style: const TextStyle(fontSize: 16)),

              if (user.phoneNumber != null && user.phoneNumber!.isNotEmpty)
                Text('Phone: $phoneNumber', style: const TextStyle(fontSize: 16)),
            ] else
              const Text('No user logged in', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
