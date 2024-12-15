import 'package:flutter/material.dart';
import 'screens/joke_types_screen.dart';
import 'screens/joke_screen.dart'; // Import JokeScreen

void main() {
  runApp(const Lab2App());
}

class Lab2App extends StatelessWidget {
  const Lab2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab2_214005',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(), // HomeScreen which wraps all the screens
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab2_214005'),
      ),
      body: const JokeTypesScreen(), // Initial screen with joke categories
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the JokeScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JokeScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50), // Button size
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25), // Rounded corners
            ),
          ),
          child: const Text(
            'Joke of the Day',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 36, 119, 79)),
          ),
        ),
      ),
    );
  }
}
