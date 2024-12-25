import 'package:air_academia_app/Homepage/Home.dart';
import 'package:air_academia_app/Homepage/login.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:air_academia_app/ai/ai.dart';
import 'package:air_academia_app/timetable/timetable.dart';
import 'package:air_academia_app/notepad/notepad.dart';
import 'package:air_academia_app/complaint/complaint.dart';
import 'package:air_academia_app/pastpapers/pastpapers.dart';
import 'package:air_academia_app/announce/announce.dart';
import 'package:air_academia_app/courseguide/courseguide.dart';
import 'package:air_academia_app/coursebooks/coursebooks.dart';
import 'package:air_academia_app/homeactivities/homeactivities.dart';

// A placeholder class for theme colors.
class TColor {
  static const primary = Color(0xFF036AA4); // Primary color
  static const dColor = Color(0xFFEFEFEF); // Background color
  static const textbox = Colors.white; // Textbox background color
  static const primaryLight = Color(0xFFB3E5FC); // Light primary color
  static const text = Colors.black; // Text color
  static const subTitle = Colors.grey; // Subtitle color
}

class dictionaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary App',
      theme: ThemeData(
        primaryColor: TColor.primary,
      ),
      home: DictionaryScreen(),
    );
  }
}

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController _controller = TextEditingController();
  String _definition = "Enter a word to get its definition.";
  bool _loading = false;

  Future<void> _fetchDefinition(String word) async {
    if (word.isEmpty) {
      setState(() {
        _definition = "Please enter a word.";
      });
      return;
    }

    setState(() {
      _loading = true;
      _definition = "";
    });

    final url =
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        setState(() {
          _definition = data[0]['meanings'][0]['definitions'][0]['definition'];
        });
      } else {
        setState(() {
          _definition = "Word not found. Try another.";
        });
      }
    } catch (e) {
      setState(() {
        _definition = "Failed to fetch definition.";
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: TColor.textbox,
                hintText: 'Enter any word...',
                hintStyle: TextStyle(color: TColor.subTitle, fontSize: 16),
                prefixIcon: Icon(Icons.search, color: TColor.primary),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear, color: TColor.primary),
                  onPressed: () {
                    _controller.clear();
                    setState(() {
                      _definition = "Enter a word to get its definition.";
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _fetchDefinition(_controller.text),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: TColor.primary,
              ),
              child: _loading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                      'Search',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: TColor.primaryLight,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                _definition,
                style: TextStyle(
                  color: TColor.text,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
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
        context,
        MaterialPageRoute(builder: (context) => targetPage),
      );
    },
  );
}
