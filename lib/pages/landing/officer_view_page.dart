import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: OfficerComplaintsPage()));
}

class OfficerComplaintsPage extends StatelessWidget {
  final List<Map<String, String>> assignedComplaints = [
    {"title": "Pothole on Main Road", "status": "Pending"},
    {"title": "Illegal Dumping Report", "status": "Resolved"},
  ];

  OfficerComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assigned Complaints",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(FontAwesomeIcons.user, size: 50)),
                Column(
                  children: [
                    Text(
                      "Officer Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Designation",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        IconButton.filled(
                            onPressed: () {}, icon: Icon(Icons.edit))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 24,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                hintFadeDuration: Duration(milliseconds: 400),
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                hintText: "Search Complaints",
                hintStyle: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Completed"),
                ),
                FilledButton(onPressed: () {}, child: Text("Pending"))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: assignedComplaints.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(bottom: 12),
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.security, color: Colors.blue, size: 40),
                    title: Text(
                      assignedComplaints[index]["title"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Status: ${assignedComplaints[index]["status"]}",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Navigate to reply page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text("Reply"),
                    ),
                  ),
                );
              },
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(16),
          //   child: ElevatedButton.icon(
          //     onPressed: () {
          //       // Navigate to complaint registration page
          //     },
          //     icon: Icon(Icons.add, size: 24),
          //     label: Text("Add Complaint", style: TextStyle(fontSize: 18)),
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.blue,
          //       foregroundColor: Colors.white,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(30)),
          //       padding: EdgeInsets.symmetric(vertical: 12),
          //       minimumSize: Size(double.infinity, 50),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
