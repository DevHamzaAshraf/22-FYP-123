import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:untitled/ViewData.dart';
import 'package:untitled/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/register.dart';
import 'package:cool_alert/cool_alert.dart';

import 'InstructorRegister.dart';
class InstructorLogin extends StatefulWidget {
  const InstructorLogin({Key? key}) : super(key: key);

  @override
  _InstructorLoginState createState() => _InstructorLoginState();
}

class _InstructorLoginState extends State<InstructorLogin> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  static Future<User?> loginusingemailpassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user=userCredential.user;
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    catch(e){
      print("Separate : $e");
    }
    return user;
  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {

            return SafeArea(

              child: Container(


                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.cover,
                  ),

                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[


                        Stack(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 60.0,
                                  ),
                                  child: Text('Assistere\n Instructor Login', textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.3,
                                  left: 35,
                                  right: 35,
                                ),
                                child: Column(
                                    children: [
                                      TextField(
                                        controller: myController,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Your Email',
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30.0),
                                      TextFormField(
                                        controller: myController2,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            CoolAlert.show(
                                              context: context,
                                              type: CoolAlertType.error,
                                              title: 'Password Is Required',
                                              loopAnimation: true,
                                              backgroundColor: Colors.white,
                                            );
                                          } else if (value.length <= 6) {
                                            CoolAlert.show(
                                              context: context,
                                              type: CoolAlertType.error,
                                              title: 'Password Must be Greated then 6 Digits',
                                              loopAnimation: true,
                                              backgroundColor: Colors.white,
                                            );
                                          }
                                        },
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Your Password',
                                          fillColor: Colors.white,
                                          filled: true,
                                          // hintText: 'Password',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                maximumSize: Size(170.0, 90.0),
                                                minimumSize: Size(170.0, 60.0),
                                                primary: Colors.black,
                                                shape: StadiumBorder(),
                                              ),
                                              onPressed: ()  {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => InstructorRegister()),
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                //crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text('Register Now'),
                                                  Icon(
                                                    Icons.app_registration_sharp,
                                                    color: Colors.white,
                                                  ),

                                                ],
                                              )
                                          ),
                                          SizedBox(width: 30,),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                maximumSize: Size(170.0, 90.0),
                                                minimumSize: Size(170.0, 60.0),
                                                primary: Colors.black,
                                                shape: StadiumBorder(),
                                              ),
                                              onPressed: () async {
                                                String email = myController.text.toString();
                                                String password = myController2.text.toString();
                                                try {
                                                  User? user = await loginusingemailpassword(
                                                      email: email,
                                                      password: password,
                                                      context: context
                                                  );
                                                  if (user != null) {
                                                    myController.clear();
                                                    myController2.clear();

                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DataBaseView()));

                                                  }
                                                  else {
                                                    CoolAlert.show(
                                                      context: context,
                                                      type: CoolAlertType.error,
                                                      title: 'Login Not Succesfull\nPlease Enter The Right Cordentials',
                                                      loopAnimation: true,
                                                      backgroundColor: Colors.white,
                                                    );

                                                  }
                                                }
                                                catch(exception){
                                                  print("Exception is: $exception");
                                                }
                                              },

                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                //crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text('LOG IN'),
                                                  Icon(
                                                    Icons.lock,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              )
                                          ),
                                          SizedBox(width: 30,),


                                        ],
                                      ),



                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

      ),
    );
  }

}

