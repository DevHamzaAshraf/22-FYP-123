

import 'package:flutter/material.dart';
import 'package:untitled/login.dart';
import 'package:untitled/register.dart';
import 'package:untitled/resetpass.dart';
import 'package:firebase_core/firebase_core.dart';

import 'FirstPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBWo8gI3rnyq3G0_dZSKDYWc01xkpq8SEo",
      appId: "178199580969",
      messagingSenderId: "178199580969",
      projectId: "assistere-f8a45",
    ),
  );



  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstpage(),

    ),
  );
}
