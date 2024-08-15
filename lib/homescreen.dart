import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title:const Center(
            child:Text("Home Page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setBool('isLoggedIn',false);
              Navigator.pushReplacementNamed(context, "/Loginscreen");

            }, icon: const Icon(Icons.arrow_back),
               iconSize: 50,
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: Text('Home Page', style:
            TextStyle(
              fontWeight: FontWeight.bold,
               fontSize: 50,

            ),),
        ),
      ),
    );
  }
}
