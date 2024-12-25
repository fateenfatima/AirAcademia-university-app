import 'package:air_academia_app/Homepage/home.dart';
import 'package:air_academia_app/Homepage/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:air_academia_app/ai/ai.dart';
import 'package:air_academia_app/homeactivities/homeactivities.dart';
import 'package:air_academia_app/timetable/timetable.dart';
import 'package:air_academia_app/notepad/notepad.dart';
import 'package:air_academia_app/pastpapers/pastpapers.dart';
import 'package:air_academia_app/announce/announce.dart';
import 'package:air_academia_app/courseguide/courseguide.dart';
import 'package:air_academia_app/coursebooks/coursebooks.dart';

//-----------------------------------------------Submit screen------------------------------------
class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

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
                  fontFamily: 'Times New Roman'),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo2.jpg', // Replace with the path to your logo image
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/done.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              "Your complaint has been successfully submitted",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
                fontFamily: 'Times New Roman',
              ),
            ),
            const Text(
              "We will address it promptly.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
                fontFamily: 'Times New Roman',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF036AA4),
              ),
              child: const Text(
                "Done",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//-----------------------complaint screen-------------------------------
class ComplaintsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ComplaintsScreen(),
    );
  }
}

class ComplaintsScreen extends StatefulWidget {
  @override
  _ComplaintsScreenState createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  final TextEditingController complaintController = TextEditingController();

  int selectedOption =
      0; // 0 means no option selected, 1 for Option 1, 2 for Option 2
  int selectedOption2 = 0;
  int selectedOption3 = 0;

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
                    fontFamily: 'Times New Roman'),
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
                'assets/logo2.jpg', // Replace with the path to your logo image
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          children: const [
                            Text(
                              "Air University, Islamabad",
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF036AA4),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "We value your Feedback. Submit your Concerns or Complaints "
                              "here to ensure a better university environment.",
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //---------------------------------------------1st---------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: const Text(
                  "Tell Us about yourself",
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              // Bar 1-----------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Student-UG",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption = value! ? 1 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //Bar 2--------------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Student-PG",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption = value! ? 2 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              //--------------------------------------2nd------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: const Text(
                  "Your Department: ",
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              //Bar 1---------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Computer Science",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption2 == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption2 = value! ? 1 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Bar 2---------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Artificial Intelligence",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption2 == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption2 = value! ? 2 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //Bar 3---------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Cyber Security",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption2 == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption2 = value! ? 3 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //Bar 4---------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Information Technology",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption2 == 4,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption2 = value! ? 4 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //Bar 5---------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Strategic Studies",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption2 == 5,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption2 = value! ? 5 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //Bar 6---------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Aviation Management",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption2 == 6,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption2 = value! ? 6 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              //--------------------------------------3rd------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: const Text(
                  "Complaint About: ",
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              //Bar 1---------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Faculty Member",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption3 == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption3 = value! ? 1 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //Bar 2---------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Management",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption3 == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption3 = value! ? 2 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //Bar 3---------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Other",
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Checkbox(
                        value: selectedOption3 == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedOption3 = value! ? 3 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // --------------------------------------------------Label above the TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: const Text(
                  "Type your Complaint Here",
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              // -----------------------------------------------------TextField for complaint input
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: TextField(
                  controller: complaintController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Enter your complaint here...",
                    filled: true,
                    fillColor:
                        Color(0xFFF9F9F9), // Set background color to F9F9F9
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1), // Lighten the outline
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1), // Change border color when focused
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                  ),
                ),
              ),
              // --------------------------------------------------------------Submit button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Center(
                  child: Container(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Get the current user ID
                        final User? user = FirebaseAuth.instance.currentUser;
                        if (user == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Please log in to submit a complaint.")),
                          );
                          return;
                        }

                        final String userId = user.uid;

                        // Get the selected department and complaint category
                        String department = "";
                        switch (selectedOption2) {
                          case 1:
                            department = "Computer Science";
                            break;
                          case 2:
                            department = "Artificial Intelligence";
                            break;
                          case 3:
                            department = "Cyber Security";
                            break;
                          case 4:
                            department = "Information Technology";
                            break;
                          case 5:
                            department = "Strategic Studies";
                            break;
                          case 6:
                            department = "Aviation Management";
                            break;
                        }

                        String complaintAbout = "";
                        switch (selectedOption3) {
                          case 1:
                            complaintAbout = "Faculty Member";
                            break;
                          case 2:
                            complaintAbout = "Management";
                            break;
                          case 3:
                            complaintAbout = "Other";
                            break;
                        }

                        // Get the complaint text
                        String complaintText = complaintController.text.trim();

                        if (department.isEmpty ||
                            complaintAbout.isEmpty ||
                            complaintText.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Please fill out all fields before submitting.")),
                          );
                          return;
                        }

                        try {
                          // Save the complaint in Firestore
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(userId)
                              .collection('complaints')
                              .add({
                            'department': department,
                            'complaintAbout': complaintAbout,
                            'complaintText': complaintText,
                            'timestamp': FieldValue.serverTimestamp(),
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Complaint submitted successfully!")),
                          );

                          // Navigate to the confirmation screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmationScreen()),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text("Error submitting complaint: $e")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF036AA4),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  //---------------------------------------------screen for submit---------------------

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Options'),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
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
        _buildNavItem(
            context, "Course Books", Icons.menu_book, CourseBooksPage()),
        _buildNavItem(
            context, "Home Activities", Icons.home, HomeActivitiesPage()),
        _buildNavItem(context, "Past Papers", Icons.quiz, PastPapersPage()),
        _buildNavItem(context, "Notepad", Icons.note, NotepadPage1()),
        _buildNavItem(context, "AI", Icons.smart_toy, AiChatboxPage()),
        _buildNavItem(
            context, "Complaints", Icons.report_problem, ComplaintsScreen()),
        _buildNavItem(
            context, "Announcements", Icons.announcement, AnnouncementsPage()),
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
