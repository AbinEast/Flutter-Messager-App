import 'package:flutter/material.dart';
import 'screens/chat_list_screen.dart';

/// Entry point of the application
void main() {
  runApp(const MyApp());
}

/// Main application widget
/// Sets up the theme and initial navigation
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      
      /// Application theme configuration
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      
      /// Initial screen of the application
      home: const ChatListScreen(),
    );
  }
}
