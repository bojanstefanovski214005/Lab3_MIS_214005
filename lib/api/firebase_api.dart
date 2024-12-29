import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lab_2/main.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initNotifications() async {
    // request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token (normally you would send this to your server)
    print('Token: $fCMToken');

    initPushNotifications();
  }

  // function to handle received messages
  void handleMessage(RemoteMessage? message) {
    // if the message is null, do nothing
    if (message == null) return;

    // navigate to a new screen when a message is received and the user taps the notification
    navigatorKey.currentState?.pushNamed(
      '/joke_screen',
    );
  }

// function to initialize background settings
  Future<void> initPushNotifications() async {
    // handle notification if the app was terminated and is now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
