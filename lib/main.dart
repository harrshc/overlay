import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isOverlayVisible = false; // Track if the overlay is visible

  void _toggleOverlay() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible; // Toggle the overlay visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // This is your main content (mimicking your home screen)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/home_background.jpg'), // Add a home screen background image
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: _toggleOverlay, // Show overlay when pressed
                child: Text('Activate Gemini-like Assistant'),
              ),
            ),
          ),

          // Overlay screen (shows at the bottom)
          if (_isOverlayVisible)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragEnd: (_) {
                  _toggleOverlay(); // Dismiss overlay on drag
                },
                child: Container(
                  height: 300, // Height of the overlay
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.5), // Semi-transparent background
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Pull down icon
                      Container(
                        width: 60,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Overlay Content (could be a microphone, assistant actions, etc.)
                      Text(
                        'Gemini Assistant Overlay',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
