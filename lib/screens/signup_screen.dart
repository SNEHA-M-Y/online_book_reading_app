import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_book_reading_app/reusable_widgets/reusable_widgets.dart';
import 'package:online_book_reading_app/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 154, 151, 236),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blueGrey,
            const Color.fromARGB(255, 186, 71, 206)
            /*

           define colours
          
           */
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                reusableTextfield("Enter Username", Icons.person_outline, false,
                    _userNameTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextfield("Enter Email ID", Icons.mail_outline, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextfield("Enter PassWord", Icons.lock_outlined, false,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignupButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((onValue) {
                    log("Created New Account");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    log("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
