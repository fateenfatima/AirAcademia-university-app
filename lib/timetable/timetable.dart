import 'package:air_academia_app/Homepage/home.dart';
import 'package:air_academia_app/Homepage/login.dart';
import 'package:flutter/material.dart';
import 'package:air_academia_app/ai/ai.dart';
import 'package:air_academia_app/homeactivities/homeactivities.dart';
import 'package:air_academia_app/notepad/notepad.dart';
import 'package:air_academia_app/complaint/complaint.dart';
import 'package:air_academia_app/pastpapers/pastpapers.dart';
import 'package:air_academia_app/announce/announce.dart';
import 'package:air_academia_app/courseguide/courseguide.dart';
import 'package:air_academia_app/coursebooks/coursebooks.dart';

void main() {
  runApp(TimetableApp());
}

class TimetableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimetableScreen(),
    );
  }
}

class TimetableScreen extends StatefulWidget {
  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  // Timetable data for different sections
  final Map<String, List<Map<String, String>>> timetableDataBySection = {
    "BSCSev-F-23-A": [
      {
        "Sr. No.": "1",
        "Subject Name": "Calculus & Analytical Geometry-1070",
        "Faculty Name": "Mr. Wajid Ali",
        "Day": "TUE",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "2",
        "Subject Name": "Calculus & Analytical Geometry-1070",
        "Faculty Name": "Mr. Wajid Ali",
        "Day": "WED",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "3",
        "Subject Name": "Data Structures Lab-1069",
        "Faculty Name": "Mr. Kaleemullah",
        "Day": "MON",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "4",
        "Subject Name": "Data Structures-1068",
        "Faculty Name": "Mr. Kaleemullah",
        "Day": "TUE",
        "Time From": "17:20",
        "Time To": "18:40",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "5",
        "Subject Name": "Data Structures-1068",
        "Faculty Name": "Mr. Kaleemullah",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "6",
        "Subject Name": "Information Security Lab-1072",
        "Faculty Name": "Mr. Danial",
        "Day": "FRI",
        "Time From": "18:40",
        "Time To": "21:20",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "7",
        "Subject Name": "Information Security-1071",
        "Faculty Name": "Mr. Danial",
        "Day": "MON",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "8",
        "Subject Name": "Information Security-1071",
        "Faculty Name": "Mr. Danial",
        "Day": "WED",
        "Time From": "20:20",
        "Time To": "20:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "9",
        "Subject Name": "Mobile Computing Lab-1076",
        "Faculty Name": "Mr. Kaleemullah",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "10",
        "Subject Name": "Mobile Computing-1075",
        "Faculty Name": "Mr. Kaleemullah",
        "Day": "WED",
        "Time From": "16:00",
        "Time To": "16:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "11",
        "Subject Name": "Mobile Computing-1075",
        "Faculty Name": "Mr. Kaleemullah",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "16:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "12",
        "Subject Name": "Probability and Statistics-1067",
        "Faculty Name": "Mr. Safdar Ali",
        "Day": "TUE",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "13",
        "Subject Name": "Probability and Statistics-1067",
        "Faculty Name": "Mr. Safdar Ali",
        "Day": "MON",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
    ],
    "BSCSev-F-23-B": [
      {
        "Sr. No.": "1",
        "Subject Name": "Calculus & Analytical Geometry-1070",
        "Faculty Name": "Mr. Wajid Ali",
        "Day": "WED",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "2",
        "Subject Name": "Calculus & Analytical Geometry-1070",
        "Faculty Name": "Mr. Wajid Ali",
        "Day": "THU",
        "Time From": "17:20",
        "Time To": "18:40",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "3",
        "Subject Name": "Data Structures Lab-1069",
        "Faculty Name": "Mr. Tauqeer Sajid",
        "Day": "TUE",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "4",
        "Subject Name": "Data Structures-1068",
        "Faculty Name": "Mr. Tauqeer Sajid",
        "Day": "MON",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "5",
        "Subject Name": "Data Structures-1068",
        "Faculty Name": "Mr. Tauqeer Sajid",
        "Day": "FRI",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "6",
        "Subject Name": "Information Security Lab-1072",
        "Faculty Name": "Ms. Kainat Nazir",
        "Day": "FRI",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "7",
        "Subject Name": "Information Security-1071",
        "Faculty Name": "Ms. Kainat Nazir",
        "Day": "MON",
        "Time From": "17:20",
        "Time To": "18:40",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "8",
        "Subject Name": "Information Security-1071",
        "Faculty Name": "Ms. Kainat Nazir",
        "Day": "WED",
        "Time From": "20:20",
        "Time To": "20:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "9",
        "Subject Name": "Mobile Computing Lab-1076",
        "Faculty Name": "Ms. Kainat Nazir",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "10",
        "Subject Name": "Mobile Computing-1075",
        "Faculty Name": "Ms. Kainat Nazir",
        "Day": "WED",
        "Time From": "16:00",
        "Time To": "16:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "11",
        "Subject Name": "Mobile Computing-1075",
        "Faculty Name": "Ms. Kainat Nazir",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "16:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "12",
        "Subject Name": "Probability and Statistics-1067",
        "Faculty Name": "Mr. Safdar Ali",
        "Day": "TUE",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "13",
        "Subject Name": "Probability and Statistics-1067",
        "Faculty Name": "Mr. Safdar Ali",
        "Day": "MON",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
    ],
    "BSCSev-F-23-C": [
      {
        "Sr. No.": "1",
        "Subject Name": "Calculus & Analytical Geometry-1070",
        "Faculty Name": "Mr. Wajid Ali",
        "Day": "WED",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "2",
        "Subject Name": "Calculus & Analytical Geometry-1070",
        "Faculty Name": "Mr. Wajid Ali",
        "Day": "THU",
        "Time From": "17:20",
        "Time To": "18:40",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "3",
        "Subject Name": "Data Structures Lab-1069",
        "Faculty Name": "Mr. Qaisar Manzoor",
        "Day": "TUE",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "4",
        "Subject Name": "Data Structures-1068",
        "Faculty Name": "Mr. Qaisar Manzoor",
        "Day": "MON",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "5",
        "Subject Name": "Data Structures-1068",
        "Faculty Name": "Mr. Qaisar Manzoor",
        "Day": "FRI",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "6",
        "Subject Name": "Information Security Lab-1072",
        "Faculty Name": " MS. Quratulain Zahid",
        "Day": "FRI",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "7",
        "Subject Name": "Information Security-1071",
        "Faculty Name": " MS. Quratulain Zahid",
        "Day": "MON",
        "Time From": "17:20",
        "Time To": "18:40",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "8",
        "Subject Name": "Information Security-1071",
        "Faculty Name": " MS. Quratulain Zahid",
        "Day": "WED",
        "Time From": "20:20",
        "Time To": "20:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "9",
        "Subject Name": "Mobile Computing Lab-1076",
        "Faculty Name": "Mr. Danial",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "10",
        "Subject Name": "Mobile Computing-1075",
        "Faculty Name": "Mr. Danial",
        "Day": "WED",
        "Time From": "16:00",
        "Time To": "16:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "11",
        "Subject Name": "Mobile Computing-1075",
        "Faculty Name": "Mr. Danial",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "16:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "12",
        "Subject Name": "Probability and Statistics-1067",
        "Faculty Name": "Mr. Safdar Ali",
        "Day": "TUE",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "13",
        "Subject Name": "Probability and Statistics-1067",
        "Faculty Name": "Mr. Safdar Ali",
        "Day": "MON",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
    ],
    "BSCSev-F-24-A": [
      {
        "Sr. No.": "1",
        "Subject Name": "Advisory Class-2933",
        "Faculty Name": "Dr. Faheem Ullah",
        "Day": "FRI",
        "Time From": "17:20",
        "Time To": "18:10",
        "Cr.Hrs": "0"
      },
      {
        "Sr. No.": "2",
        "Subject Name": "Application of Information & Communication Technologies Lab-2928",
        "Faculty Name": "MS. Quratulain Zahid",
        "Day": "WED",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "3",
        "Subject Name": "Application of Information & Communication Technologies-2927",
        "Faculty Name": "MS. Quratulain Zahid",
        "Day": "WED",
        "Time From": "20:00",
        "Time To": "20:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "4",
        "Subject Name": "Application of Information & Communication Technologies-2927",
        "Faculty Name": "MS. Quratulain Zahid",
        "Day": "FRI",
        "Time From": "17:20",
        "Time To": "18:10",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "5",
        "Subject Name": "Applied Physics Lab-2925",
        "Faculty Name": "Dr. Rubina Nasir",
        "Day": "TUE",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "6",
        "Subject Name": "Applied Physics-2924",
        "Faculty Name": "Dr. Nasir Majid",
        "Day": "MON",
        "Time From": "17:20",
        "Time To": "18:40",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "7",
        "Subject Name": "Applied Physics-2924",
        "Faculty Name": "Dr. Nasir Majid",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "8",
        "Subject Name": "Functional English-2923",
        "Faculty Name": "Ms Asma Tauqeer",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "9",
        "Subject Name": "Functional English-2923",
        "Faculty Name": "Ms Asma Tauqeer",
        "Day": "FRI",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "10",
        "Subject Name": "Ideology & Constitution of Pakistan-2926",
        "Faculty Name": "Mr. Rafiul Haq",
        "Day": "MON",
        "Time From": "18:10",
        "Time To": "12:00",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "11",
        "Subject Name": "Ideology & Constitution of Pakistan-2926",
        "Faculty Name": "Mr. Rafiul Haq",
        "Day": "TUE",
        "Time From": "20:50",
        "Time To": "20:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "12",
        "Subject Name": "Programming Fundamentals Lab-2930",
        "Faculty Name": " Mr. M Bilal Khan",
        "Day": "MON",
        "Time From": "18:40",
        "Time To": "21:20",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "13",
        "Subject Name": "Programming Fundamentals-2929",
        "Faculty Name": " Mr. M Bilal Khan",
        "Day": "THU",
        "Time From": "20:00",
        "Time To": "21:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "14",
        "Subject Name": "Programming Fundamentals-2929",
        "Faculty Name": " Mr. M Bilal Khan",
        "Day": "FRI",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
    ],
    "BSCSev-F-24-B": [
      {
        "Sr. No.": "1",
        "Subject Name": "Advisory Class-2933",
        "Faculty Name": "MS. Quratulain Zahid",
        "Day": "WED",
        "Time From": "17:20",
        "Time To": "18:10",
        "Cr.Hrs": "0"
      },
      {
        "Sr. No.": "2",
        "Subject Name": "Application of Information & Communication Technologies Lab-2928",
        "Faculty Name": " Mr. Qaisar Manzoor",
        "Day": "WED",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "3",
        "Subject Name": "Application of Information & Communication Technologies-2927",
        "Faculty Name": "Mr. M Bilal Khan",
        "Day": "TUE",
        "Time From": "20:00",
        "Time To": "20:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "4",
        "Subject Name": "Application of Information & Communication Technologies-2927",
        "Faculty Name": "Mr. M Bilal Khan",
        "Day": "WED",
        "Time From": "17:20",
        "Time To": "18:10",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "5",
        "Subject Name": "Applied Physics Lab-2925",
        "Faculty Name": "Noman Yousaf",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "6",
        "Subject Name": "Applied Physics-2924",
        "Faculty Name": "Dr. Nasir Majid",
        "Day": "MON",
        "Time From": "17:20",
        "Time To": "18:40",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "7",
        "Subject Name": "Applied Physics-2924",
        "Faculty Name": "Dr. Nasir Majid",
        "Day": "TUE",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "8",
        "Subject Name": "Functional English-2923",
        "Faculty Name": "Ms Asma Tauqeer",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "9",
        "Subject Name": "Functional English-2923",
        "Faculty Name": "Ms Asma Tauqeer",
        "Day": "FRI",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "10",
        "Subject Name": "Ideology & Constitution of Pakistan-2926",
        "Faculty Name": " Mr. Rafiul Haq",
        "Day": "TUE",
        "Time From": "18:10",
        "Time To": "12:00",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "11",
        "Subject Name": "Ideology & Constitution of Pakistan-2926",
        "Faculty Name": " Mr. Rafiul Haq",
        "Day": "MON",
        "Time From": "20:50",
        "Time To": "20:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "12",
        "Subject Name": "Programming Fundamentals Lab-2930",
        "Faculty Name": " Ms. Mustabshera",
        "Day": "FRI",
        "Time From": "18:40",
        "Time To": "21:20",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "13",
        "Subject Name": "Programming Fundamentals-2929",
        "Faculty Name": " Ms. Mustabshera",
        "Day": "WED",
        "Time From": "20:00",
        "Time To": "21:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "14",
        "Subject Name": "Programming Fundamentals-2929",
        "Faculty Name": " Ms. Mustabshera",
        "Day": "FRI",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
    ],
    "BSCSev-F-24-C": [
      {
        "Sr. No.": "1",
        "Subject Name": "Advisory Class-2933",
        "Faculty Name": "Mr. Tauqeer Sajid",
        "Day": "WED",
        "Time From": "17:20",
        "Time To": "18:10",
        "Cr.Hrs": "0"
      },
      {
        "Sr. No.": "2",
        "Subject Name": "Application of Information & Communication Technologies Lab-2928",
        "Faculty Name": "Ms. Mustabshera Fatima",
        "Day": "MON",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "3",
        "Subject Name": "Application of Information & Communication Technologies-2927",
        "Faculty Name": "Ms. Mustabshera Fatima",
        "Day": "TUE",
        "Time From": "20:00",
        "Time To": "20:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "4",
        "Subject Name": "Application of Information & Communication Technologies-2927",
        "Faculty Name": "Ms. Mustabshera Fatima",
        "Day": "WED",
        "Time From": "17:20",
        "Time To": "18:10",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "5",
        "Subject Name": "Applied Physics Lab-2925",
        "Faculty Name": "Dr. Rubina Nasir",
        "Day": "FRI",
        "Time From": "16:00",
        "Time To": "18:40",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "6",
        "Subject Name": "Applied Physics-2924",
        "Faculty Name": "Dr. Nasir Majid",
        "Day": "THU",
        "Time From": "17:20",
        "Time To": "18:40",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "7",
        "Subject Name": "Applied Physics-2924",
        "Faculty Name": "Dr. Nasir Majid",
        "Day": "TUE",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "8",
        "Subject Name": "Functional English-2923",
        "Faculty Name": "Ms. Ishrat Amer",
        "Day": "WED",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "9",
        "Subject Name": "Functional English-2923",
        "Faculty Name": "Ms. Ishrat Amer",
        "Day": "THU",
        "Time From": "16:00",
        "Time To": "17:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "10",
        "Subject Name": "Ideology & Constitution of Pakistan-2926",
        "Faculty Name": "Dr. Asim Khan",
        "Day": "TUE",
        "Time From": "18:10",
        "Time To": "12:00",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "11",
        "Subject Name": "Ideology & Constitution of Pakistan-2926",
        "Faculty Name": "Ms. Amna Aziz",
        "Day": "MON",
        "Time From": "20:50",
        "Time To": "20:50",
        "Cr.Hrs": "2"
      },
      {
        "Sr. No.": "12",
        "Subject Name": "Programming Fundamentals Lab-2930",
        "Faculty Name": "Dr. Faheem Ullah",
        "Day": "WED",
        "Time From": "18:40",
        "Time To": "21:20",
        "Cr.Hrs": "1"
      },
      {
        "Sr. No.": "13",
        "Subject Name": "Programming Fundamentals-2929",
        "Faculty Name": "Dr. Faheem Ullah",
        "Day": "THU",
        "Time From": "20:00",
        "Time To": "21:20",
        "Cr.Hrs": "3"
      },
      {
        "Sr. No.": "14",
        "Subject Name": "Programming Fundamentals-2929",
        "Faculty Name": "Dr. Faheem Ullah",
        "Day": "FRI",
        "Time From": "18:40",
        "Time To": "20:00",
        "Cr.Hrs": "3"
      },
    ],
  };

  // Dropdown-related variables
  final List<String> sections = [
    "Select the section",
    "BSCSev-F-24-A",
    "BSCSev-F-24-B",
    "BSCSev-F-24-C",
    "BSCSev-F-23-A",
    "BSCSev-F-23-B",
    "BSCSev-F-23-C"
  ];
  String selectedSection = "Select the section";
  @override
  Widget build(BuildContext context) {
    final timetableData = timetableDataBySection[selectedSection] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF036AA4),
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 8),
            const Text(
              'AirAcademia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Times New Roman'),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
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
                          "Time Table",
                          style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF036AA4),
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
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(65),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedSection,
                hint: const Text(
                  "Select the section",
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
                    selectedSection = newValue!;
                  });
                },
                items: sections.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (selectedSection != "Select the section") ...[
            Center(
              child: Column(
                children: [
                  Text(
                    "Session: F-24",
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Class: $selectedSection",
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Table(
                      border: TableBorder.all(color: Colors.grey.shade400, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(3),
                        2: FlexColumnWidth(2),
                        3: FlexColumnWidth(1),
                        4: FlexColumnWidth(1),
                        5: FlexColumnWidth(1),
                        6: FlexColumnWidth(1),
                      },
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(color: Color(0xFF036AA4)),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Sr. No.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Subject Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Faculty Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Day", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Time From", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Time To", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Cr.Hrs", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        ...timetableData.map((row) {
                          return TableRow(
                            children: [
                              Padding(padding: const EdgeInsets.all(8.0), child: Text(row["Sr. No."]!)),
                              Padding(padding: const EdgeInsets.all(8.0), child: Text(row["Subject Name"]!)),
                              Padding(padding: const EdgeInsets.all(8.0), child: Text(row["Faculty Name"]!)),
                              Padding(padding: const EdgeInsets.all(8.0), child: Text(row["Day"]!)),
                              Padding(padding: const EdgeInsets.all(8.0), child: Text(row["Time From"]!)),
                              Padding(padding: const EdgeInsets.all(8.0), child: Text(row["Time To"]!)),
                              Padding(padding: const EdgeInsets.all(8.0), child: Text(row["Cr.Hrs"]!)),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ] else
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/logo1.jpg',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
        ],
      ),
    );
  }

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
