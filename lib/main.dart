import 'package:flutter/material.dart';
import 'package:lab_2/screens/favorite.dart';
import 'package:provider/provider.dart';
import 'provider/favorite_provider.dart';
import 'screens/joke_types_screen.dart';
import 'screens/joke_screen.dart'; // Import JokeScreen
import 'package:firebase_core/firebase_core.dart';
import '/api/firebase_api.dart';
import '/firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const Lab2App());
}

class Lab2App extends StatelessWidget {
  const Lab2App({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        title: 'Lab3_214005',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen(), // HomeScreen which wraps all the screens
        navigatorKey: navigatorKey,
        routes: {
          '/joke_screen': (context) => const JokeScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab3_214005'),
      ),
      body: const JokeTypesScreen(), // Initial screen with joke categories
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the JokeScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JokeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50), // Adjusted button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25), // Rounded corners
                ),
              ),
              child: const Text(
                'Joke of the Day',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 36, 119, 79),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality for the second button
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50), // Adjusted button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25), // Rounded corners
                ),
              ),
              child: const Text(
                'Liked jokes',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 36, 119, 79),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
