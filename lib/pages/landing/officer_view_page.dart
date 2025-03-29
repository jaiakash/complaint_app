import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: FaIcon(FontAwesomeIcons.user,
                      size: 30, color: Colors.black87),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Officer Name",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("Designation",
                          style: GoogleFonts.nunito(color: Colors.grey[700])),
                      SizedBox(height: 8),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: index < 4 ? Colors.yellow : Colors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.logout, color: Colors.red),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                hintText: "Search complaints...",
                hintStyle: GoogleFonts.nunito(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: assignedComplaints.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    leading: Icon(Icons.report, color: Colors.blue, size: 40),
                    title: Text(
                      assignedComplaints[index]["title"]!,
                      style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Status: ${assignedComplaints[index]["status"]}",
                      style: GoogleFonts.nunito(
                          color:
                              assignedComplaints[index]["status"] == "Pending"
                                  ? Colors.red
                                  : Colors.green),
                    ),
                    trailing:
                        Icon(Icons.chevron_right, color: Colors.blue, size: 30),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
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
