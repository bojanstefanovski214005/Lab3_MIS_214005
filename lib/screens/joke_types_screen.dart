import 'package:flutter/material.dart';
import '../services/api_services.dart';
import 'jokes_by_category_screen.dart'; // New screen to show jokes by category

class JokeTypesScreen extends StatefulWidget {
  const JokeTypesScreen({super.key});

  @override
  _JokeTypesScreenState createState() => _JokeTypesScreenState();
}

class _JokeTypesScreenState extends State<JokeTypesScreen> {
  late Future<List<String>> _jokeTypes;

  @override
  void initState() {
    super.initState();
    _jokeTypes = ApiServices.fetchJokeTypes(); // Fetch joke types
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: _jokeTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No joke categories available.'));
          } else {
            final jokeTypes = snapshot.data!;
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ], // Background gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // One card per row
                  crossAxisSpacing: 16.0, // Horizontal spacing
                  mainAxisSpacing: 16.0, // Vertical spacing
                  childAspectRatio: 4, // Adjust size of cards
                ),
                itemCount: jokeTypes.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 36, 119, 79),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        // Navigate to screen with jokes of this type
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                JokesByCategoryScreen(type: jokeTypes[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            jokeTypes[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
