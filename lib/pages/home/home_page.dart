import 'package:complaint_app/pages/auth/auth_wrapper.dart';
import 'package:complaint_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;
    final AuthService _authService = AuthService();

    // Simulate a role for the user (you can replace this with actual user role info)
    final String userRole = 'user'; // Example role: 'officer' or 'user'

    // Mock data for officers
    final int assignedComplaints =
        5; // Example data: officer's assigned complaints
    final int pendingComplaints =
        2; // Example data: officer's pending complaints
    final int resolvedComplaints =
        3; // Example data: officer's resolved complaints

    // Mock data for regular users
    final bool userCanSearch =
        true; // Whether the user can search for a department

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.poppins(),
        ),
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
            Text(
              'Welcome!',
              style: GoogleFonts.poppins(
                  fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'User: ${user?.displayName ?? 'No username'}',
              style: GoogleFonts.nunito(fontSize: 18),
            ),
            Text(
              'Email: ${user?.email ?? 'No email'}',
              style: GoogleFonts.nunito(fontSize: 18),
            ),
            const SizedBox(height: 40),

            // Conditional rendering based on user role
            if (userRole == 'officer') ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  spacing: 24,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.assignment, size: 40),
                        Text(
                          'Total Assigned Complaints: $assignedComplaints',
                          style: GoogleFonts.nunito(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        const Icon(Icons.pending_actions, size: 40),
                        Text(
                          'Pending Complaints: $pendingComplaints',
                          style: GoogleFonts.nunito(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        const Icon(Icons.check, size: 40),
                        Text(
                          'Resolved Complaints: $resolvedComplaints',
                          style: GoogleFonts.nunito(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Add other officer-specific info here
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/assignedComplaints'),
                  child: Text(
                    "My Complaints",
                    style: GoogleFonts.poppins(),
                  ))
            ] else if (userRole == 'user') ...[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Welcome User! You can search for a department to file a complaint.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                  ),
                ),
              ),
              if (userCanSearch) ...[
                const SizedBox(height: 8),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.blue[100],
                  ),
                  onPressed: () => {},
                  child: Text(
                    'Search for a Department',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/userComplaints'),
                  child: Text(
                    'My Complaints',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
