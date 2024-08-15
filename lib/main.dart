import 'package:assignment_03/homescreen.dart';
import 'package:assignment_03/loginscreen.dart';
import 'package:assignment_03/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Ensure that Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Check if user is logged in by retrieving a boolean value from SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  // Determine the initial route based on the login status
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? const homescreen() : const splashscreen(),
      routes:{
        '/splashscreen':(context)=> const splashscreen(),
        '/homescreen':(context)=> const homescreen(),
        '/Loginscreen':(context)=> const Loginscreen()
      },
    );
  }
}