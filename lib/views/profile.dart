// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/auth/login.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "My Account",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white10,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 120,
                      backgroundImage: NetworkImage(
                          'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Clipart.png'),
                      backgroundColor: Colors.white,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Stack(
                          children: [
                            FloatingActionButton.small(
                              backgroundColor: Colors.pink[400],
                              onPressed: pickImage,
                              child: Icon(Icons.add_a_photo_outlined),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.redAccent),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 17),
                        )),
                  )),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 30),
                    child: Text(
                      "Account Information",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      title: Text("Full Name",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      subtitle: Text("SHAYAN ARSHAD",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      title: Text("Email",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      subtitle: Text("muhammadshayan8900@gmail.com",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      title: Text("Phone",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      subtitle: Text("03432507953",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      title: Text("Gender",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      subtitle: Text("Male",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
