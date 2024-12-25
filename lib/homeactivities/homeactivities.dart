import 'package:air_academia_app/Homepage/home.dart';
import 'package:air_academia_app/Homepage/login.dart';
import 'package:flutter/material.dart';
import 'package:air_academia_app/ai/ai.dart';
import 'package:air_academia_app/timetable/timetable.dart';
import 'package:air_academia_app/notepad/notepad.dart';
import 'package:air_academia_app/complaint/complaint.dart';
import 'package:air_academia_app/pastpapers/pastpapers.dart';
import 'package:air_academia_app/announce/announce.dart';
import 'package:air_academia_app/courseguide/courseguide.dart';
import 'package:air_academia_app/coursebooks/coursebooks.dart';

class HomeActivitiesPage extends StatefulWidget {
  const HomeActivitiesPage({Key? key}) : super(key: key);

  @override
  _HomeActivitiesPageState createState() => _HomeActivitiesPageState();
}

class _HomeActivitiesPageState extends State<HomeActivitiesPage> {
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
      'Ideology of Pakistan' // Added new subject
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

  // Home activities for each subject
  final Map<String, List<Map<String, String>>> _homeActivities = {
    "Applied Physics": [
      {
        "Week": "Week#4",
        "Activity": "Experiment on Ohm's Law",
        "Marks": "10",
        "Submission Date": "10/10/2024"
      },
      {
        "Week": "Week#8",
        "Activity": "Write a report on Electromagnetic Waves",
        "Marks": "15",
        "Submission Date": "10/17/2024"
      },
      {
        "Week": "Week#13",
        "Activity": "Solve numerical problems on Kinematics",
        "Marks": "20",
        "Submission Date": "10/24/2024"
      },
      {
        "Week": "Week#15",
        "Activity": "Group presentation on Thermodynamics",
        "Marks": "15",
        "Submission Date": "10/31/2024"
      },
    ],
    "Programming Fundamentals": [
      {
        "Week": "Week#3",
        "Activity": "Write a program to calculate factorial",
        "Marks": "10",
        "Submission Date": "10/12/2024"
      },
      {
        "Week": "Week#9",
        "Activity": "Implement a number guessing game",
        "Marks": "15",
        "Submission Date": "10/19/2024"
      },
      {
        "Week": "Week#10",
        "Activity": "Quiz on basic syntax and data types",
        "Marks": "20",
        "Submission Date": "10/26/2024"
      },
      {
        "Week": "Week#15",
        "Activity": "Develop a mini calculator",
        "Marks": "15",
        "Submission Date": "11/02/2024"
      },
    ],
    "Functional English": [
      {
        "Week": "Week#2",
        "Activity": "Write an essay on Climate Change",
        "Marks": "10",
        "Submission Date": "10/10/2024"
      },
      {
        "Week": "Week#7",
        "Activity": "Practice formal letter writing",
        "Marks": "15",
        "Submission Date": "10/17/2024"
      },
      {
        "Week": "Week#11",
        "Activity": "Vocabulary building exercise",
        "Marks": "20",
        "Submission Date": "10/24/2024"
      },
      {
        "Week": "Week#15",
        "Activity": "Write a story using vocabulary words",
        "Marks": "15",
        "Submission Date": "10/31/2024"
      },
    ],
    "Information and Communication Technology": [
      {
        "Week": "Week#3",
        "Activity": "Research on History of Computers",
        "Marks": "10",
        "Submission Date": "10/10/2024"
      },
      {
        "Week": "Week#8",
        "Activity": "Create a presentation on Networking",
        "Marks": "15",
        "Submission Date": "10/17/2024"
      },
      {
        "Week": "Week#12",
        "Activity": "Quiz on Computer Hardware",
        "Marks": "20",
        "Submission Date": "10/24/2024"
      },
      {
        "Week": "Week#14",
        "Activity": "Group project on Internet Safety",
        "Marks": "15",
        "Submission Date": "10/31/2024"
      },
    ],
    "Ideology of Pakistan": [
      {
        "Week": "Week#2",
        "Activity": "Write a report on Pakistan Movement",
        "Marks": "10",
        "Submission Date": "10/10/2024"
      },
      {
        "Week": "Week#8",
        "Activity": "Research on Quaid-e-Azam's Speeches",
        "Marks": "15",
        "Submission Date": "10/17/2024"
      },
      {
        "Week": "Week#10",
        "Activity": "Quiz on Important Events",
        "Marks": "20",
        "Submission Date": "10/24/2024"
      },
      {
        "Week": "Week#13",
        "Activity": "Write an essay on Two-Nation Theory",
        "Marks": "15",
        "Submission Date": "10/31/2024"
      },
    ],
    "Database Systems": [
      {
        "Week": "Week#3",
        "Activity": "Design an ER Diagram",
        "Marks": "10",
        "Submission Date": "10/11/2024"
      },
      {
        "Week": "Week#7",
        "Activity": "Create a relational schema",
        "Marks": "15",
        "Submission Date": "10/18/2024"
      },
      {
        "Week": "Week#10",
        "Activity": "Quiz on SQL Queries",
        "Marks": "20",
        "Submission Date": "10/25/2024"
      },
      {
        "Week": "Week#13",
        "Activity": "Group project on database normalization",
        "Marks": "15",
        "Submission Date": "11/01/2024"
      },
    ],
    "Object Oriented Programing": [
      {
        "Week": "Week#3",
        "Activity": "Write a program using classes and objects",
        "Marks": "10",
        "Submission Date": "10/11/2024"
      },
      {
        "Week": "Week#7",
        "Activity": "Implement inheritance in a program",
        "Marks": "15",
        "Submission Date": "10/18/2024"
      },
      {
        "Week": "Week#9",
        "Activity": "Quiz on Polymorphism and Encapsulation",
        "Marks": "20",
        "Submission Date": "10/25/2024"
      },
      {
        "Week": "Week#12",
        "Activity": "Create a project using file handling",
        "Marks": "15",
        "Submission Date": "11/01/2024"
      },
    ],
    "Digital Logic Design": [
      {
        "Week": "Week#1",
        "Activity": "Design basic logic gates",
        "Marks": "10",
        "Submission Date": "10/11/2024"
      },
      {
        "Week": "Week#4",
        "Activity": "Implement combinational circuits",
        "Marks": "15",
        "Submission Date": "10/18/2024"
      },
      {
        "Week": "Week#9",
        "Activity": "Quiz on flip-flops and counters",
        "Marks": "20",
        "Submission Date": "10/25/2024"
      },
      {
        "Week": "Week#13",
        "Activity": "Create a sequential circuit diagram",
        "Marks": "15",
        "Submission Date": "11/01/2024"
      },
    ],
    "Expository Writing": [
      {
        "Week": "Week#1",
        "Activity": "Write a descriptive essay",
        "Marks": "10",
        "Submission Date": "10/11/2024"
      },
      {
        "Week": "Week#7",
        "Activity": "Write a comparison essay",
        "Marks": "15",
        "Submission Date": "10/18/2024"
      },
      {
        "Week": "Week#11",
        "Activity": "Quiz on writing styles",
        "Marks": "20",
        "Submission Date": "10/25/2024"
      },
      {
        "Week": "Week#15",
        "Activity": "Write a persuasive essay",
        "Marks": "15",
        "Submission Date": "11/01/2024"
      },
    ],
    "Discrete Structure": [
      {
        "Week": "Week#3",
        "Activity": "Solve problems on Set Theory",
        "Marks": "10",
        "Submission Date": "10/12/2024"
      },
      {
        "Week": "Week#7",
        "Activity": "Write a report on Graph Theory Applications",
        "Marks": "15",
        "Submission Date": "10/19/2024"
      },
      {
        "Week": "Week#9",
        "Activity": "Quiz on Logical Connectives",
        "Marks": "20",
        "Submission Date": "10/26/2024"
      },
      {
        "Week": "Week#12",
        "Activity": "Solve examples of Propositional Logic",
        "Marks": "15",
        "Submission Date": "11/02/2024"
      },
    ],
    "Data Structures and Algorithms": [
      {
        "Week": "Week#2",
        "Activity": "Implement a stack using arrays",
        "Marks": "10",
        "Submission Date": "10/13/2024"
      },
      {
        "Week": "Week#6",
        "Activity": "Write code for a queue implementation",
        "Marks": "15",
        "Submission Date": "10/20/2024"
      },
      {
        "Week": "Week#11",
        "Activity": "Quiz on Tree Traversals",
        "Marks": "20",
        "Submission Date": "10/27/2024"
      },
      {
        "Week": "Week#14",
        "Activity": "Implement a sorting algorithm",
        "Marks": "15",
        "Submission Date": "11/03/2024"
      },
    ],

    "Calculus and Analytical Geometry": [
      {
        "Week": "Week#3",
        "Activity": "Solve problems on Limits and Continuity",
        "Marks": "10",
        "Submission Date": "10/13/2024"
      },
      {
        "Week": "Week#9",
        "Activity": "Practice Derivatives of Trigonometric Functions",
        "Marks": "15",
        "Submission Date": "10/20/2024"
      },
      {
        "Week": "Week#11",
        "Activity": "Quiz on Integration Techniques",
        "Marks": "20",
        "Submission Date": "10/27/2024"
      },
      {
        "Week": "Week#14",
        "Activity": "Solve examples on 3D Geometry",
        "Marks": "15",
        "Submission Date": "11/03/2024"
      },
    ],

    "Mobile Computing": [
      {
        "Week": "Week#3",
        "Activity": "Research on Mobile Networking",
        "Marks": "10",
        "Submission Date": "10/14/2024"
      },
      {
        "Week": "Week#9",
        "Activity": "Write a report on IoT Devices",
        "Marks": "15",
        "Submission Date": "10/21/2024"
      },
      {
        "Week": "Week#11",
        "Activity": "Quiz on Cloud Computing Concepts",
        "Marks": "20",
        "Submission Date": "10/28/2024"
      },
      {
        "Week": "Week#13",
        "Activity": "Develop a mobile app prototype",
        "Marks": "15",
        "Submission Date": "11/04/2024"
      },
    ],

    "Information Security": [
      {
        "Week": "Week#3",
        "Activity": "Create a report on Cybersecurity Risks",
        "Marks": "10",
        "Submission Date": "10/14/2024"
      },
      {
        "Week": "Week#8",
        "Activity": "Research on Cryptographic Algorithms",
        "Marks": "15",
        "Submission Date": "10/21/2024"
      },
      {
        "Week": "Week#9",
        "Activity": "Quiz on Network Security Protocols",
        "Marks": "20",
        "Submission Date": "10/28/2024"
      },
      {
        "Week": "Week#11",
        "Activity": "Present a case study on Data Breaches",
        "Marks": "15",
        "Submission Date": "11/04/2024"
      },
    ],

    "Probability and Statistics": [
      {
        "Week": "Week#4",
        "Activity": "Solve problems on Probability Distributions",
        "Marks": "10",
        "Submission Date": "10/15/2024"
      },
      {
        "Week": "Week#8",
        "Activity": "Write a report on Sampling Techniques",
        "Marks": "15",
        "Submission Date": "10/22/2024"
      },
      {
        "Week": "Week#13",
        "Activity": "Quiz on Hypothesis Testing",
        "Marks": "20",
        "Submission Date": "10/29/2024"
      },
      {
        "Week": "Week#15",
        "Activity": "Analyze a dataset using statistical methods",
        "Marks": "15",
        "Submission Date": "11/05/2024"
      },
    ],
    // Add data for other subjects similarly
  };

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
              'assets/logo2.jpg',
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
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
                  'Home Activities',
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

              // Display center logo if no selection is made
              if (_selectedSemester == null && _selectedSubject == null)
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/logo1.jpg', // Replace with your logo asset path
                      fit: BoxFit.contain,
                      width: 400, // Increased size for better visibility
                      height: 400,
                    ),
                  ),
                ),

              // Display tables
              if (_selectedSubject != null)
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Table(
                        border: TableBorder.all(color: Colors.grey),
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(3),
                          2: FlexColumnWidth(1),
                          3: FlexColumnWidth(2),
                        },
                        children: [
                          // Header row
                          TableRow(
                            decoration: const BoxDecoration(color: Color(0xFF036AA4)),
                            children: [
                              headerCell("Week"),
                              headerCell("Activity Description"),
                              headerCell("Marks"),
                              headerCell("Submission Date"),
                            ],
                          ),
                          // Data rows
                          ...(_homeActivities[_selectedSubject] ?? []).map((activity) {
                            return TableRow(
                              children: [
                                dataCell(activity["Week"]!),
                                dataCell(activity["Activity"]!),
                                dataCell(activity["Marks"]!),
                                dataCell(activity["Submission Date"]!),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget headerCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget dataCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
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
    home: HomeActivitiesPage(),
    debugShowCheckedModeBanner: false,
  ));
}
