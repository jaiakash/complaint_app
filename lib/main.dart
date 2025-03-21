import 'package:complaint_app/firebase_options.dart';
import 'package:complaint_app/pages/auth/auth_wrapper.dart';
import 'package:complaint_app/pages/home/home_page.dart';
import 'package:complaint_app/pages/landing/officer_view_page.dart';
import 'package:complaint_app/pages/landing/user_view_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AuthWrapper(),
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => HomeScreen(),
        '/userComplaints': (context) => UserComplaintsPage(),
        '/assignedComplaints': (context) => OfficerComplaintsPage(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
