
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String email="abc@gmail.com";
String password="123456";
bool? isLoggedIn;

 class Loginscreen extends StatefulWidget {
   const Loginscreen({super.key});
 
   @override
   State<Loginscreen> createState() => _LoginscreenState();
 }
 void main(){

 }
 class _LoginscreenState extends State<Loginscreen> {

   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.grey,
           title:const Center(
             child: Text('LoginPage',
               style: TextStyle(
                   fontSize: 40,
                   fontWeight: FontWeight.bold
               ),),
           ),
           automaticallyImplyLeading: false,
         ),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
               child: Align(
               alignment: Alignment.centerLeft,
               child:Text(
                 "Email",
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                 ),
               ),
             ),
             ),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
             child: TextField(
               controller: _emailController,
               decoration: InputDecoration(
                 hintText: "Enter your email",
                 filled: true,
                 fillColor: const Color.fromARGB(255, 240, 240, 240), // Background color
                 contentPadding:const  EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Padding inside the TextField
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15.0), // Rounded corners
                   borderSide: const BorderSide(
                     color: Colors.grey, // Border color
                     width: 2.0, // Border width
                   ),
                 ),
               ),
             ),
       ),
             const SizedBox(
               height: 40,
             ),
             const Padding(
               padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
               child:  Align(
                 alignment: Alignment.centerLeft,
                 child:Text(
                   "Password",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 20,
                   ),
                 ),
               ),
             ),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: TextField(
               controller: _passwordController,
               obscureText: true,
               decoration: InputDecoration(
                 hintText: "Enter your password",
                   prefixIcon: const Icon(Icons.lock),
                 filled: true,
                 fillColor: const Color.fromARGB(255, 240, 240, 240), // Background color
                 contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Padding inside the TextField
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15.0), // Rounded corners
                   borderSide: const BorderSide(
                     color: Colors.grey, // Border color
                     width: 2.0, // Border width
               ),
             ),
               ),
             ),
       ),
             const SizedBox(
               height: 40,
             ),
             ElevatedButton(

                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color.fromARGB(255, 5, 241, 13),
                   minimumSize: const Size(350, 50),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(5),
                   ),
                 ),
                 onPressed:()async{
              SharedPreferences sp= await SharedPreferences.getInstance();
              sp.setBool('isLoggedIn', true);
              if(_emailController.text==email && _passwordController.text==password){
                isLoggedIn=sp.getBool('isLoggedIn');
                Navigator.pushReplacementNamed(context, '/homescreen');
              }
               else{
                 showDialog(
                   context: context,
                   builder: (context) {
                     return AlertDialog(
                       title: const Text('Error'),
                       content: const Text('Incorrect email or password. Please try again.'),
                       actions: [
                         TextButton(
                           onPressed: () {
                             Navigator.of(context).pop();
                           },
                           child: const Text('OK'),
                         ),
                       ],
                     );
                   },
                 );
               }
             },
                 child: const Text("Login",style: TextStyle(
               fontSize: 40,
               fontWeight: FontWeight.bold,
               color: Colors.white
             ),

             ))

           ],
         ),
       ),
      );
   }
 }

