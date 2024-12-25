import 'package:air_academia_app/Homepage/home.dart';
import 'package:air_academia_app/Homepage/login.dart';
import 'package:flutter/material.dart';
import 'package:air_academia_app/ai/ai.dart';
import 'package:air_academia_app/homeactivities/homeactivities.dart';
import 'package:air_academia_app/timetable/timetable.dart';
import 'package:air_academia_app/notepad/notepad.dart';
import 'package:air_academia_app/complaint/complaint.dart';
import 'package:air_academia_app/pastpapers/pastpapers.dart';
import 'package:air_academia_app/announce/announce.dart';
import 'package:air_academia_app/coursebooks/coursebooks.dart';

class CourseGuidePage extends StatefulWidget {
  @override
  _CourseGuidePageState createState() => _CourseGuidePageState();
}

class _CourseGuidePageState extends State<CourseGuidePage> {
  final Map<String, List<String>> _subjects = {
    "1st Semester": [
      "Applied Physics",
      "Programming Fundamentals",
      "Information Technology",
      "Functional English",
      "Ideology of Pakistan"
    ],
    "2nd Semester": [
      "Object-Oriented Programming",
      "Digital Logic Design",
      "Database Systems",
      "Expository writing",
      "Discrete Structures"
    ],
    "3rd Semester": [
      "Data Structures and Algorithms",
      "Probability and Statistics",
      "Mobile Computing",
      "Information Security",
      "Calculus and Analytical Geometry"
    ],
  };

  final Map<String, String> _subjectImages = {
    "Applied Physics": "asset/phy.jpg",
    "Programming Fundamentals": "asset/pf.jpg",
    "Information Technology": "asset/ict.jpg",
    "Functional English": "asset/functional_english.jpg",
    "Ideology of Pakistan": "asset/ideology_of_pakistan.jpg",
    "Object-Oriented Programming": "asset/oop.jpg",
    "Digital Logic Design": "asset/dld.jpg",
    "Database Systems": "asset/database_systems.jpg",
    "Expository writing": "asset/expository_writing.jpg",
    "Discrete Structures": "asset/discrete_structures.jpg",
    "Data Structures and Algorithms": "asset/data_structures.jpg",
    "Probability and Statistics": "asset/probability.jpg",
    "Mobile Computing": "asset/mobile_computing.jpg",
    "Information Security": "asset/information_security.jpg",
    "Calculus and Analytical Geometry": "asset/calculus.jpg",
  };

  String? _selectedSemester;
  String? _selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF036AA4),
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 8),
            const Text(
              'AirAcademia',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Times New Roman',
              ),
            ),
          ],
        ),
        centerTitle: true,
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'asset/logo2.jpg',
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Foreground content
          Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: const Text(
                  'Air University, Islamabad',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF036AA4),
                  ),
                ),
              ),
              Center(
                child: const Text(
                  'Course Guide',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF036AA4),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown for semesters
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: 345,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(75),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedSemester,
                    hint: const Text(
                      "Select the semester",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.black),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Times New Roman',
                    ),
                    underline: Container(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedSemester = newValue;
                        _selectedSubject = null;
                      });
                    },
                    items: _subjects.keys
                        .map<DropdownMenuItem<String>>((String semester) {
                      return DropdownMenuItem<String>(
                        value: semester,
                        child: Text(semester),
                      );
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Dropdown for subjects
              if (_selectedSemester != null)
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: 450,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(75),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedSubject,
                      hint: const Text(
                        "Select the subject",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Times New Roman',
                      ),
                      underline: Container(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSubject = newValue;
                        });
                      },
                      items: _subjects[_selectedSemester]!
                          .map<DropdownMenuItem<String>>((String subject) {
                        return DropdownMenuItem<String>(
                          value: subject,
                          child: Text(subject),
                        );
                      }).toList(),
                    ),
                  ),
                ),

              const SizedBox(height: 16),

              // Display selected image or background logo
              if (_selectedSemester == null && _selectedSubject == null)
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'asset/logo1.jpg', // Replace with your logo asset path
                      fit: BoxFit.contain,
                      width: 400, // Increased size for better visibility
                      height: 400,
                    ),
                  ),
                )
              else if (_selectedSubject != null)
                Expanded(
                  child: Center(
                    child: Image.asset(
                      _subjectImages[_selectedSubject]!,
                      fit: BoxFit.contain,
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationDrawer(BuildContext context) {
    return Container(
      color: const Color(0xFF036AA4),
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
          _buildNavItem(context, "Notepad", Icons.note, NotepadPage1()),
          _buildNavItem(context, "AI", Icons.smart_toy, AiChatboxPage()),
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
