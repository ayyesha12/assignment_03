import 'package:flutter/material.dart';


class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/Loginscreen');
    });
  }

  @override
  Widget build(BuildContext context) {

    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Welcome to Flutter sukkur",
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
      //initialRoute: '/',

    );
  }
}