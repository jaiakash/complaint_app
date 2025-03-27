import 'package:flutter/material.dart';
import 'package:complaint_app/services/auth/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class UserComplaintsPage extends StatelessWidget {
  final List<Map<String, String>> complaints = [
    {"title": "Water Leakage", "status": "Open", "date": "March 15, 2025"},
    {
      "title": "Street Light Not Working",
      "status": "Closed",
      "date": "March 10, 2025"
    },
    {
      "title": "Pothole on Main Road",
      "status": "Open",
      "date": "March 18, 2025"
    },
    {
      "title": "Garbage Not Collected",
      "status": "Closed",
      "date": "March 12, 2025"
    },
    {
      "title": "Broken Bench in Park",
      "status": "Open",
      "date": "March 14, 2025"
    },
    {"title": "No Water Supply", "status": "Pending", "date": "March 16, 2025"},
  ];

  UserComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Complaints",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(Icons.person,
                            color: Colors.blue, size: 26),
                      ),
                      const SizedBox(width: 12),
                      Text(
                          'Welcome, ${authService.currentUser?.displayName ?? "User Name"}!',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                          )),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.red),
                    onPressed: () {
                      // Handle logout action
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Complaints",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: GoogleFonts.nunito(
                        decoration: TextDecoration.combine([
                          TextDecoration.underline,
                        ]),
                        color: Colors.blue,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.blue,
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 10),
            // Grid layout for complaints
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 5),
                itemCount: complaints.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two complaints per row
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2, // Adjusts height of cards
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to complaint details page
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(
                                alpha: 0.2, blue: 0, green: 0, red: 0),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Complaint title and right arrow icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  complaints[index]["title"]!,
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  size: 16, color: Colors.grey),
                            ],
                          ),
                          const Spacer(),
                          // Status and date at the bottom
                          Text(
                            "Status: ${complaints[index]["status"]}",
                            style: TextStyle(
                                color: complaints[index]["status"] == "Open"
                                    ? Colors.orange
                                    : (complaints[index]["status"] == "Pending"
                                        ? Colors.red
                                        : Colors.green),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Text(
                            "Date: ${complaints[index]["date"]}",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to complaint registration page
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 28, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        elevation: 5,
      ),
    );
  }
}
