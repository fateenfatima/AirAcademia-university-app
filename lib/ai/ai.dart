import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:air_academia_app/Homepage/Home.dart';

class ChatBotService {
  static const String apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent";
  static const String apiKey = "AIzaSyByHaIxlGnv3vZLXn51yc2Futc05EgPExc";

  static Future<String> sendMessage(String message) async {
    try {
      final headers = {
        "Content-Type": "application/json",
      };

      final body = jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": message}
            ]
          }
        ]
      });

      print("Using API key: $apiKey");

      final response = await http.post(
        Uri.parse('$apiUrl?key=$apiKey'),
        headers: headers,
        body: body,
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Parsed Response: $data"); // Log the parsed response

        if (data.containsKey('candidates') &&
            data['candidates'] != null &&
            data['candidates'][0]['content'] != null &&
            data['candidates'][0]['content']['parts'] != null) {
          return data['candidates'][0]['content']['parts'][0]['text'] ??
              "No response from Bard";
        } else {
          return "No valid content in the response";
        }
      } else {
        return "Error: ${response.statusCode}, ${response.body}";
      }
    } catch (e) {
      print("Exception: $e");
      return "Error: Unable to send message. $e";
    }
  }
}

class AiChatboxPage extends StatefulWidget {
  const AiChatboxPage({Key? key}) : super(key: key);

  @override
  _AiChatbox createState() => _AiChatbox();
}

class _AiChatbox extends State<AiChatboxPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  // Function to send message and get AI response
  void _sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      _messageController.clear();
      setState(() {
        _messages.add({'message': message, 'isUser': true});
      });

      // Call the API to get AI response
      final aiResponse = await ChatBotService.sendMessage(message);
      setState(() {
        _messages.add({'message': aiResponse, 'isUser': false});
      });
    }
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
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
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
              'assets/logo2.jpg',
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['isUser']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: ChatBubble(
                      message: message['message'],
                      isUser: message['isUser'],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.attachment, color: Color(0xFF036AA4)),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Message AI...",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF036AA4)),
                    onPressed: _sendMessage, // Send message on button press
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({Key? key, required this.message, required this.isUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isUser ? Colors.blue[100] : Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AiChatboxPage(),
  ));
}
