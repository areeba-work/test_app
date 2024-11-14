import 'package:flutter/material.dart';

void main() => runApp(GreetingApp());

// The main app widget that wraps the greeting screen in a MaterialApp
class GreetingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GreetingScreen(),
    );
  }
}

// The stateful widget for the single screen in the app
class GreetingScreen extends StatefulWidget {
  @override
  _GreetingScreenState createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  // Controller to capture text input from the user
  final TextEditingController _controller = TextEditingController();

  // Variable to store the text entered by the user
  String _displayedText = '';

  // Method to update the displayed text when the button is clicked
  void _showGreeting() {
    setState(() {
      _displayedText = _controller.text; // Set the displayed text to the user input
      final String name =_controller.text.trim();

      if(name.isNotEmpty) {
        _displayedText= 'Hello $name!';
      }
        else {
          _displayedText = 'Please enter your name';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Greeting App")), // AppBar with a title
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the entire screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center elements vertically
          children: [
            // TextField for user input with a label and border styling
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter your text here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0), // Spacing between TextField and Button
            // Button to trigger the display of the entered text
            ElevatedButton(
              onPressed: _showGreeting, // Calls _showGreeting on button press
              child: Text("Show Greeting"),
            ),
            SizedBox(height: 16.0), // Spacing between Button and displayed text
            // Display the text entered by the user below the button
            Text(
              _displayedText, // Shows the stored input text
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Text styling
            ),
          ],
        ),
      ),
    );
  }
}
