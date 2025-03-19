import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: UserComplaintsPage()));
}

class UserComplaintsPage extends StatelessWidget {
  final List<Map<String, String>> complaints = [
    {"title": "Water Leakage", "status": "Open", "date": "March 15, 2025"},
    {
      "title": "Street Light Not Working",
      "status": "Closed",
      "date": "March 10, 2025"
    },
  ];

  UserComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Complaints",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: complaints.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(bottom: 12),
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.blue, size: 40),
                    title: Text(
                      complaints[index]["title"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Status: ${complaints[index]["status"]} • Date: ${complaints[index]["date"]}",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    trailing: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: complaints[index]["status"] == "Open"
                            ? Colors.orange
                            : Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        complaints[index]["status"]!,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to complaint registration page
              },
              icon: Icon(Icons.add, size: 24),
              label: Text("Add Complaint", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(vertical: 12),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
