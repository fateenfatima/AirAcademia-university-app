import 'package:air_academia_app/Homepage/home.dart';
import 'package:air_academia_app/Homepage/login.dart';
import 'package:flutter/material.dart';
import 'package:air_academia_app/ai/ai.dart';
import 'package:air_academia_app/homeactivities/homeactivities.dart';
import 'package:air_academia_app/timetable/timetable.dart';
import 'package:air_academia_app/complaint/complaint.dart';
import 'package:air_academia_app/pastpapers/pastpapers.dart';
import 'package:air_academia_app/announce/announce.dart';
import 'package:air_academia_app/courseguide/courseguide.dart';
import 'package:air_academia_app/coursebooks/coursebooks.dart';

void main() {
  runApp(MaterialApp(
    home: NotepadPage1(),
    debugShowCheckedModeBanner: false,
  ));
}

class NotepadPage1 extends StatefulWidget {
  @override
  _NotepadPage1State createState() => _NotepadPage1State();
}

class _NotepadPage1State extends State<NotepadPage1> {
  List<Map<String, dynamic>> notes = [];
  String searchQuery = '';

  void addNote(String title, String content) {
    setState(() {
      notes.add({
        'title': title,
        'content': content,
        'isFavorite': false
      });
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      notes[index]['isFavorite'] = !notes[index]['isFavorite'];
    });
  }

  void editNote(int index, String newTitle, String newContent) {
    setState(() {
      notes[index]['title'] = newTitle;
      notes[index]['content'] = newContent;
    });
  }

  List<Map<String, dynamic>> get filteredNotes {
    return notes.where((note) => note['title'].toLowerCase().contains(searchQuery.toLowerCase())).toList();
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search document',
                prefixIcon: Icon(Icons.search, color: Color(0xFF036AA4)), // Blue color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateNotePage(
                          onSave: addNote,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text('Quick Note', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF036AA4), // Blue color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoritesPage(
                          notes: notes, // Pass notes here to manage favorites
                          toggleFavorite: toggleFavorite, // Pass toggleFavorite function
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.favorite, color: Colors.white),
                  label: Text('Favourites', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF036AA4), // Blue color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: filteredNotes.length,
                itemBuilder: (context, index) {
                  final note = filteredNotes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditNotePage(
                            note: note,
                            index: index,
                            onSave: editNote,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFF036AA4), // Blue color
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8.0),
                            Expanded(
                              child: Text(
                                note['content'],
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon: Icon(
                                  note['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                                  color: note['isFavorite'] ? Colors.red : Color(0xFF036AA4),
                                ),
                                onPressed: () => toggleFavorite(index),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditNotePage extends StatefulWidget {
  final Map<String, dynamic> note;
  final int index;
  final Function(int, String, String) onSave;

  EditNotePage({
    required this.note,
    required this.index,
    required this.onSave,
  });

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    contentController = TextEditingController(text: widget.note['content']);
  }

  void saveNote(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController titleController = TextEditingController(text: widget.note['title']);
        return AlertDialog(
          title: Text('Save Note', style: TextStyle(color: Color(0xFF036AA4))),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter title for the note',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            style: TextStyle(color: Color(0xFF036AA4)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF036AA4),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                if (title.isNotEmpty) {
                  widget.onSave(widget.index, title, contentController.text.trim());
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Close the Edit Note page
                }
              },
              child: Text('Save', style: TextStyle(color: Color(0xFF036AA4))),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Color(0xFF036AA4)),
              ),
            ),
          ],
        );
      },
    );
  }

  void discardNote() {
    Navigator.pop(context); // Close the Edit Note page without saving
  }

  void showSaveOrDiscardDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('What do you want to do?', style: TextStyle(color: Color(0xFF036AA4))),
        content: Text('Do you want to save or discard this note?', style: TextStyle(color: Color(0xFF036AA4))),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              discardNote();
            },
            child: Text('Discard', style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF036AA4),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              saveNote(context);
            },
            child: Text('Save', style: TextStyle(color: Color(0xFF036AA4))),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color(0xFF036AA4)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF036AA4),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          ElevatedButton(
            onPressed: showSaveOrDiscardDialog,
            child: Text('Save', style: TextStyle(color: Color(0xFF036AA4))),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color(0xFF036AA4)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Enter note content',
                  border: InputBorder.none, // No border
                ),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateNotePage extends StatefulWidget {
  final Function(String, String) onSave;

  CreateNotePage({required this.onSave});

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final TextEditingController contentController = TextEditingController();

  void saveNote(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController titleController = TextEditingController();
        return AlertDialog(
          title: Text('Save Note', style: TextStyle(color: Color(0xFF036AA4))),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter title for the note',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            style: TextStyle(color: Color(0xFF036AA4)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF036AA4),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                if (title.isNotEmpty) {
                  widget.onSave(title, contentController.text.trim());
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Close the Quick Note page
                }
              },
              child: Text('Save', style: TextStyle(color: Color(0xFF036AA4))),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Color(0xFF036AA4)),
              ),
            ),
          ],
        );
      },
    );
  }

  void discardNote() {
    Navigator.pop(context); // Close the Quick Note page without saving
  }

  void showSaveOrDiscardDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('What do you want to do?', style: TextStyle(color: Color(0xFF036AA4))),
        content: Text('Do you want to save or discard this note?', style: TextStyle(color: Color(0xFF036AA4))),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              discardNote();
            },
            child: Text('Discard', style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF036AA4),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              saveNote(context);
            },
            child: Text('Save', style: TextStyle(color: Color(0xFF036AA4))),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color(0xFF036AA4)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Note', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF036AA4),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          ElevatedButton(
            onPressed: showSaveOrDiscardDialog,
            child: Text('Save', style: TextStyle(color: Color(0xFF036AA4))),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Color(0xFF036AA4)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: contentController,
          maxLines: null,
          expands: true,
          decoration: InputDecoration(
            hintText: 'Start writing your note...',
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> notes;
  final Function(int) toggleFavorite;

  FavoritesPage({required this.notes, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> favoriteNotes = notes.where((note) => note['isFavorite']).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Notes', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF036AA4),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: favoriteNotes.isEmpty
          ? Center(child: Text('No favorite notes', style: TextStyle(color: Colors.white)))
          : ListView.builder(
              itemCount: favoriteNotes.length,
              itemBuilder: (context, index) {
                final note = favoriteNotes[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(note['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      note['content'], // Show full content of the note
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () => toggleFavorite(notes.indexOf(note)), // Toggle favorite when pressed
                    ),
                  ),
                );
              },
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
