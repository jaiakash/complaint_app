import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void initialize() {
    //Foreground Message Handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground Message Received!");
      print("Title: ${message.notification?.title}");
      print("Body: ${message.notification?.body}");

      // Show notification using flutter_local_notifications (optional)
    });

    //Background Message Handling (User Clicks Notification)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("User tapped on notification: ${message.data}");

      // Navigate to specific screen if needed
    });
  }
}
