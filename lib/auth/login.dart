// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/auth/signup.dart';
import 'package:news_app/views/home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    login() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String email = emailController.text;
      final String password = passwordController.text;

      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        final DocumentSnapshot snapshot =
            await db.collection("users").doc(user.user!.uid).get();
        final data = snapshot.data();
        print("User login Successfully");

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        showDialog(
            context: (context),
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(""),
              );
            });
      }
    }

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
                    "Login",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 100,
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
                      "Don't have an account ?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text("Create account",
                          style: TextStyle(
                              fontSize: 16, color: Colors.purple[400])),
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
                    onPressed: login,
                    child: Text(
                      "Login",
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
      ),
    );
  }
}
