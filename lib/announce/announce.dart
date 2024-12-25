import 'package:air_academia_app/Homepage/home.dart';
import 'package:flutter/material.dart';
//import 'package:air_academia_app/announce/announce.dart';
//import 'package:air_academia_app/ai/ai.dart';
//import 'package:air_academia_app/homeactivities/homeactivities.dart';
//import 'package:air_academia_app/timetable/timetable.dart';
//import 'package:air_academia_app/notepad/notepad.dart';
//import 'package:air_academia_app/complaint/complaint.dart';
//import 'package:air_academia_app/pastpapers/pastpapers.dart';
//import 'package:air_academia_app/courseguide/courseguide.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnouncementsPage(),
    );
  }
}

class AnnouncementsPage extends StatelessWidget {
  final List<Map<String, String>> announcements = [
    {
      "title": "Air University Islamabad has decided to conduct all undergraduate and graduate classes online on",
      "highlight": "Friday 22 November 2024",
      "footer": "Air university Islamabad"
    },
    {
      "title": "Due to a political strike on November 24th, NEXUS 2024 has been postponed. New dates will be announced soon.",
      "highlight": "",
      "footer": "Air university Islamabad"
    },
  ];

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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Times New Roman'),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo2.jpg', // Replace with your logo path
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/wer.jpg', // Add your background image here
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              const Text(
                'Air University, Islamabad\nAnnouncements',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF036AA4),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(12), // Adjust padding for compactness
                    constraints: const BoxConstraints(
                      maxWidth: 500, // Set a maximum width to reduce size
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Adjust to make the box smaller
                      children: [
                        Text(
                          "${announcements.length} Announcements",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12), // Reduced spacing for compactness
                        ListView.builder(
                          shrinkWrap: true, // Prevents the ListView from taking all available space
                          physics: const NeverScrollableScrollPhysics(), // Disable scrolling for better fitting
                          itemCount: announcements.length,
                          itemBuilder: (context, index) {
                            final announcement = announcements[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                padding: const EdgeInsets.all(12), // Reduced padding for items
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF2F2F2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      announcement["title"]!,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    if (announcement["highlight"] != null && announcement["highlight"]!.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Text(
                                          announcement["highlight"]!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, color: Color(0xFF036AA4)),
                                        const SizedBox(width: 8),
                                        Text(
                                          announcement["footer"]!,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8), // Reduced final spacing
                        const Text(
                          'Air University, Islamabad\nE9 complex',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
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
}
