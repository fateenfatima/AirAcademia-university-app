import 'package:air_academia_app/Homepage/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:air_academia_app/ai/ai.dart';
import 'package:air_academia_app/homeactivities/homeactivities.dart';
import 'package:air_academia_app/timetable/timetable.dart';
import 'package:air_academia_app/notepad/notepad.dart';
import 'package:air_academia_app/complaint/complaint.dart';
import 'package:air_academia_app/pastpapers/pastpapers.dart';
import 'package:air_academia_app/announce/announce.dart';
import 'package:air_academia_app/courseguide/courseguide.dart';
import 'package:air_academia_app/coursebooks/coursebooks.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:air_academia_app/dictionary/dictionary.dart';

class HomePage extends StatelessWidget {
  final String classroomUrl = 'https://classroom.google.com/';

  const HomePage({super.key});

  // Method to navigate to Google Classroom
  Future<void> _navigateToClassroom() async {
    if (await canLaunch(classroomUrl)) {
      await launch(classroomUrl);
    } else {
      throw 'Could not launch $classroomUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF036AA4),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return _buildNavigationDrawer(context);
              },
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "AirAcademia",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman',
              ),
            ),
            Image.asset(
              'assets/logo2.jpg',
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // First Row: 3 Boxes
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGridItem(
                      context, "Notepad", "assets/notepad.jpg", NotepadPage1()),
                  SizedBox(width: 15),
                  _buildGridItem(context, "Course Guide", "assets/course.jpg",
                      CourseGuidePage()),
                  SizedBox(width: 15),
                  _buildGridItem(context, "Complaint", "assets/complaint.jpg",
                      ComplaintsApp()),
                ],
              ),
              SizedBox(height: 15),
              // Second Row: 3 Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGridItem(
                      context, "AI", "assets/AI.jpg", AiChatboxPage()),
                  SizedBox(width: 15),
                  _buildGridItem(context, "Course Books",
                      "assets/course_books.jpg", CourseBooksPage()),
                  SizedBox(width: 15),
                  _buildGridItem(context, "Timetable", "assets/timetable.jpg",
                      TimetableApp()),
                ],
              ),
              SizedBox(height: 15),
              // Third Row: 2 Boxes Centered
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGridItem(context, "Home Activities", "assets/home.jpg",
                      HomeActivitiesPage()),
                  SizedBox(width: 15),
                  _buildGridItem(context, "Past Papers", "assets/pp.jpg",
                      PastPapersPage()),
                  SizedBox(width: 15),
                  _buildGridItem(context, "Announcements", "assets/anoun.jpg",
                      AnnouncementsPage()),
                ],
              ),
              SizedBox(height: 15),
              // Fourth Row: 2 Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google Classroom Button with Logo
                  Container(
                    width: 170, // Adjusted the width of the GCR button box
                    height:
                        170, // Ensured the height fits nicely for the button
                    decoration: BoxDecoration(
                      color: Colors.white, // White background for the box
                      borderRadius: BorderRadius.circular(
                          8), // Rounded corners (like your other boxes)
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent, // Transparent background for the button, so the container's background shows
                        shadowColor: Colors
                            .transparent, // Remove shadow to maintain consistency
                      ),
                      onPressed: _navigateToClassroom,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the content vertically
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the content horizontally
                        children: [
                          Image.asset(
                            "assets/gcr_logo.jpg", // Your GCR logo
                            height:
                                40, // Adjust the height of the logo to fit within the box
                          ),
                          SizedBox(
                              height:
                                  10), // Add space between the logo and text
                          Text(
                            'Google Classroom',
                            style: TextStyle(
                              color: Color(
                                  0xFF036AA4), // Blue text color, similar to your design
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  14, // Adjust the font size to fit better in the box
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                      width:
                          20), // Increased space between the GCR button and dictionary button

                  // Dictionary Page Button
                  _buildGridItem(
                    context,
                    "Dictionary",
                    "assets/dictionary.jpg", // Ensure this icon exists
                    dictionaryPage(), // Navigate to the Dictionary page (make sure to define the page properly)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Grid item widget to create the clickable boxes
  Widget _buildGridItem(
      BuildContext context, String title, String imagePath, Widget targetPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => targetPage));
      },
      child: Container(
        width: 170, // Fixed width
        height: 170, // Fixed height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 40), // Image size
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF036AA4)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Navigation drawer widget
  Widget _buildNavigationDrawer(BuildContext context) {
    return Container(
      color: Color(0xFF036AA4),
      child: ListView(
        children: [
          _buildNavItem(context, "Home", Icons.home, HomePage()),
          _buildNavItem(context, "Timetable", Icons.schedule, TimetableApp()),
          _buildNavItem(context, "Course Guide", Icons.book, CourseGuidePage()),
          _buildNavItem(
              context, "Course Books", Icons.menu_book, CourseBooksPage()),
          _buildNavItem(
              context, "Home Activities", Icons.home, HomeActivitiesPage()),
          _buildNavItem(context, "Past Papers", Icons.quiz, PastPapersPage()),
          _buildNavItem(context, "Dictionary", Icons.book, dictionaryPage()),
          _buildNavItem(context, "Notepad", Icons.note, NotepadPage1()),
          _buildNavItem(context, "AI", Icons.book, AiChatboxPage()),
          _buildNavItem(
              context, "Complaints", Icons.report_problem, ComplaintsScreen()),
          _buildNavItem(context, "Announcements", Icons.announcement,
              AnnouncementsPage()),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white),
            title: Text("Logout", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()));
            },
          ),
        ],
      ),
    );
  }

  // Helper function to create navigation items
  Widget _buildNavItem(
      BuildContext context, String title, IconData icon, Widget targetPage) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => targetPage));
      },
    );
  }
}
