// screens/joke_screen.dart
import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  late Future<Joke> _joke;

  @override
  void initState() {
    super.initState();
    _joke = ApiServices.fetchJoke(); // Call API for joke
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke of the Day'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 36, 119, 79),
              Color.fromARGB(255, 36, 119, 79)
            ], // Background gradient
          ),
        ),
        child: Center(
          child: FutureBuilder<Joke>(
            future: _joke,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Show loader while waiting for the response
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final joke = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Card(
                    elevation: 8.0, // Adding shadow for card
                    color: Colors.white.withOpacity(
                        0.9), // Card color with slight transparency
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Setup Text with big, bold font
                          Text(
                            joke.setup,
                            style: const TextStyle(
                              fontSize: 20, // Larger font size for the setup
                              fontWeight:
                                  FontWeight.bold, // Bold font for setup
                              color: Colors
                                  .black, // Text color for better contrast
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          // Punchline Text with slightly smaller font but still prominent
                          Text(
                            joke.punchline,
                            style: const TextStyle(
                              fontSize:
                                  20, // Slightly smaller font for punchline
                              fontWeight: FontWeight
                                  .w600, // Bold but not as much as setup
                              color: Color.fromARGB(
                                  255, 229, 65, 65), // Text color for punchline
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
