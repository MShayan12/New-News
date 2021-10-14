// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/auth/login.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  signup() async {
    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    try {
      final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await db
          .collection("users")
          .doc(user.user!.uid)
          .set({'username': username, 'email': email});
      print("User is SignUp");
    } catch (e) {
      showDialog(
          context: (context),
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [],
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55.0),
                child: Text(
                  "SignUp",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: 'Enter your email',
                  label: Text("USERNAME"),
                  labelStyle:
                      TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: 'Enter your email',
                  label: Text("EMAIL"),
                  labelStyle:
                      TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: 'Enter your password',
                  label: Text("PASSWORD"),
                  labelStyle:
                      TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already have an account ?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text("SignIn",
                        style:
                            TextStyle(fontSize: 16, color: Colors.purple[400])),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                  onPressed: signup,
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    elevation: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
