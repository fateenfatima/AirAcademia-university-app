import 'package:air_academia_app/Homepage/home.dart';
import 'package:air_academia_app/Homepage/login.dart';
import 'package:flutter/material.dart';
import 'package:air_academia_app/complaint/complaint.dart';
import 'package:air_academia_app/ai/ai.dart';
import 'package:air_academia_app/homeactivities/homeactivities.dart';
import 'package:air_academia_app/timetable/timetable.dart';
import 'package:air_academia_app/notepad/notepad.dart';
import 'package:air_academia_app/announce/announce.dart';
import 'package:air_academia_app/courseguide/courseguide.dart';
import 'package:air_academia_app/coursebooks/coursebooks.dart';

class PastPapersPage extends StatefulWidget {
  const PastPapersPage({Key? key}) : super(key: key);

  @override
  _PastPapersPageState createState() => _PastPapersPageState();
}

class _PastPapersPageState extends State<PastPapersPage> {
  // Current selected semester and subject
  String? _selectedSemester;
  String? _selectedSubject;

  // Nested data for semesters and subjects
  final Map<String, List<String>> _subjects = {
    '1st Semester': [
      'Applied Physics',
      'Programming Fundamentals',
      'Functional English',
      'Information and Communication Technology',
      'Ideology of Pakistan'
    ],
    '2nd Semester': [
      'Database Systems',
      'Object Oriented Programming',
      'Digital Logic Design',
      'Expository Writing',
      'Discrete Structure'
    ],
    '3rd Semester': [
      'Data Structures and Algorithms',
      'Calculus and Analytical Geometry',
      'Mobile Computing',
      'Information Security',
      'Probability and Statistics'
    ],
  };

  // Past papers for each subject
  final Map<String, List<String>> _pastPapers = {
    'Applied Physics': [
      'assets/Images/ap_paper1.jpg',
      'assets/Images/ap_paper2.jpg'
    ],
    'Programming Fundamentals': [
      'assets/Images/pf_paper1.jpg',
      'assets/Images/pf_paper2.jpg'
    ],
    'Functional English': [
      'assets/Images/fe_paper1.jpg',
      'assets/Images/fe_paper2.jpg'
    ],
    'Information and Communication Technology': [
      'assets/Images/ict_paper1.jpg',
      'assets/Images/ict_paper2.jpg'
    ],
    'Ideology of Pakistan': [
      'assets/Images/iop_paper1.jpg',
      'assets/Images/iop_paper2.jpg'
    ],
    'Database Systems': [
      'assets/Images/db_paper1.jpg',
      'assets/Images/db_paper2.jpg'
    ],
    'Object Oriented Programming': [
      'assets/Images/oop_paper1.jpg',
      'assets/Images/oop_paper2.jpg'
    ],
    'Digital Logic Design': [
      'assets/Images/dld_paper1.jpg',
      'assets/Images/dld_paper2.jpg'
    ],
    'Expository Writing': [
      'assets/Images/ew_paper1.jpg',
      'assets/Images/ew_paper2.jpg'
    ],
    'Discrete Structure': [
      'assets/Images/ds_paper1.jpg',
      'assets/Images/ds_paper2.jpg'
    ],
    'Data Structures and Algorithms': [
      'assets/Images/dsa_paper1.jpg',
      'assets/Images/dsa_paper2.jpg'
    ],
    'Calculus and Analytical Geometry': [
      'assets/Images/cag_paper1.jpg',
      'assets/Images/cag_paper2.jpg'
    ],
    'Mobile Computing': [
      'assets/Images/mc_paper1.jpg',
      'assets/Images/mc_paper2.jpg'
    ],
    'Information Security': [
      'assets/Images/is_paper1.jpg',
      'assets/Images/is_paper2.jpg'
    ],
    'Probability and Statistics': [
      'assets/Images/ps_paper1.jpg',
      'assets/Images/ps_paper2.jpg'
    ],
  };

  // Names for each subject's instructor
  final Map<String, List<String>> _instructors = {
    'Applied Physics': [
      'Dr. Ayesha',
      'Ma’am Fatima'
    ],
    'Programming Fundamentals': [
      'Ma’am Sara',
      'Dr. Uzma'
    ],
    'Functional English': [
      'Dr. Nadia',
      'Ma’am Hina'
    ],
    'Information and Communication Technology': [
      'Dr. Ali',
      'Ma’am Sana'
    ],
    'Ideology of Pakistan': [
      'Dr. Ahmed',
      'Dr. Maryam'
    ],
    'Database Systems': [
      'Dr. Bilal',
      'Ma’am Hira'
    ],
    'Object Oriented Programming': [
      'Ma’am Amina',
      'Dr. Faisal'
    ],
    'Digital Logic Design': [
      'Dr. Kashif',
      'Ma’am Rida'
    ],
    'Expository Writing': [
      'Dr. Raza',
      'Ma’am Zahra'
    ],
    'Discrete Structure': [
      'Dr. Aslam',
      'Ma’am Seema'
    ],
    'Data Structures and Algorithms': [
      'Dr. Hammad',
      'Ma’am Sara'
    ],
    'Calculus and Analytical Geometry': [
      'Dr. Iftikhar',
      'Ma’am Shahida'
    ],
    'Mobile Computing': [
      'Dr. Umair',
      'Ma’am Mariam'
    ],
    'Information Security': [
      'Dr. Imran',
      'Ma’am Nida'
    ],
    'Probability and Statistics': [
      'Dr. Sameer',
      'Ma’am Kashaf'
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF036AA4),
        titleSpacing: 0,
        centerTitle: true, // Center the title in the app bar
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
              'assets/logo2.jpg',
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image (only visible when no semester or subject selected)
          if (_selectedSemester == null && _selectedSubject == null)
            Center(
              child: Image.asset(
                'assets/logo1.jpg', // Replace with your background image
                fit: BoxFit.cover,
                width: 200, // Adjust width and height as needed
                height: 200,
              ),
            ),
          Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'Air University, Islamabad',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF036AA4),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Past Papers',
                  style: const TextStyle(
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
                    value: _selectedSemester,
                    hint: const Text(
                      "Select the semester",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
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
                    items: _subjects.keys.map<DropdownMenuItem<String>>((String semester) {
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
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
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
                      items: _subjects[_selectedSemester]!.map<DropdownMenuItem<String>>((String subject) {
                        return DropdownMenuItem<String>(
                          value: subject,
                          child: Text(subject),
                        );
                      }).toList(),
                    ),
                  ),
                ),

              const SizedBox(height: 16),

              // Display past papers buttons
              if (_selectedSubject != null)
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      pastPaperBox("Past Paper by ${_instructors[_selectedSubject]![0]}", () {
                        navigateToPastPaperImages(context, _pastPapers[_selectedSubject]![0]);
                      }),
                      const SizedBox(height: 16),
                      pastPaperBox("Past Paper by ${_instructors[_selectedSubject]![1]}", () {
                        navigateToPastPaperImages(context, _pastPapers[_selectedSubject]![1]);
                      }),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pastPaperBox(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF036AA4),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void navigateToPastPaperImages(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PastPaperImageViewer(imagePath: imagePath),
      ),
    );
  }
}

class PastPaperImageViewer extends StatelessWidget {
  final String imagePath;
  const PastPaperImageViewer({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF036AA4),
        title: const Text("Past Paper Image"),
      ),
      body: Center(
        child: Image.asset(imagePath), // Show the image of the past paper
      ),
    );
  }
}

Widget _buildNavigationDrawer(BuildContext context) {
  return Container(
    color: Color(0xFF036AA4),
    child: ListView(
      children: [
        _buildNavItem(context, "Home", Icons.home, HomePage()),
        _buildNavItem(context, "Timetable", Icons.schedule, TimetableApp()),
        _buildNavItem(context, "Course Guide", Icons.book, CourseGuidePage()),
        _buildNavItem(context, "Course Books", Icons.menu_book, CourseBooksPage()),
        _buildNavItem(context, "Home Activities", Icons.home, HomeActivitiesPage()),
        _buildNavItem(context, "Past Papers", Icons.quiz, PastPapersPage()),
        _buildNavItem(context, "Notepad", Icons.note, NotepadPage1()),
        _buildNavItem(context, "AI", Icons.smart_toy, AiChatboxPage()),
        _buildNavItem(context, "Complaints", Icons.report_problem, ComplaintsScreen()),
        _buildNavItem(context, "Announcements", Icons.announcement, AnnouncementsPage()),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.white),
          title: Text("Logout", style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdScreen()));
          },
        ),
      ],
    ),
  );
}

Widget _buildNavItem(BuildContext context, String title, IconData icon, Widget targetPage) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    title: Text(title, style: TextStyle(color: Colors.white)),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => targetPage));
    },
  );
}

void main() {
  runApp(MaterialApp(
    home: PastPapersPage(),
    debugShowCheckedModeBanner: false,
  ));
}
