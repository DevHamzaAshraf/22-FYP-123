import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:untitled/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
import 'package:cool_alert/cool_alert.dart';

class myRegister extends StatefulWidget {
  const myRegister({Key? key}) : super(key: key);

  @override
  _myRegisterState createState() => _myRegisterState();
}

class _myRegisterState extends State<myRegister> {
  final _emailcontroller=TextEditingController();
  final _passcontroller=TextEditingController();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  Future<User?> registerUsingEmailPassword({

    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: 'Password Is Weak, A Stronger Password is Required of 6 Characters',
          loopAnimation: true,
          backgroundColor: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: 'Email Already In Use, Try Coming Up with something Different',
          loopAnimation: true,
          backgroundColor: Colors.white,
        );
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {

                return SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange

                    ),
                    child: Scaffold(
                      appBar: AppBar(
                          elevation: null,
                          backgroundColor: Colors.transparent,
                          leading: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  myLogin()),
                              );
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                          )),
                      backgroundColor: Colors.transparent,
                      body: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'REGISTER\n NOW',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.28,
                                left: 35,
                                right: 35,
                              ),
                              child: Column(
                                children: [

                                  TextField(
                                    controller: _emailcontroller,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      hintText: 'Email',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),


                                  SizedBox(height: 30.0),
                                  TextField(
                                    controller: _passcontroller,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                                      ),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      hintText: 'Password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            maximumSize: const Size(170.0, 90.0),
                                            minimumSize: const Size(170.0, 60.0),
                                            primary: Colors.black,
                                            shape: const StadiumBorder(),
                                          ),
                                          onPressed: () async {
                                            String email=_emailcontroller.text.toString();
                                            String password=_passcontroller.text.toString();


                                            User? user =await registerUsingEmailPassword(
                                              email: email,
                                              password: password,
                                            );
                                            if (user != null) {
                                              CoolAlert.show(
                                                  context: context,
                                                  type: CoolAlertType.success,
                                                  title: 'You have Registered Succesfully',
                                                  confirmBtnText: 'Go To Login Page',
                                                  onConfirmBtnTap: ()=> Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) =>  myLogin()),
                                                  ),
                                                  loopAnimation: true,
                                                  backgroundColor: Colors.white,
                                                  lottieAsset: 'assets/signup.json'
                                              );
                                            }
                                            else {
                                              // CoolAlert.show(
                                              //     context: context,
                                              //     type: CoolAlertType.error,
                                              //     title: 'Sign up Not Succesful',
                                              //     loopAnimation: true,
                                              //     backgroundColor: Colors.white,
                                              //
                                              // );
                                            }
                                          },

                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('REGISTER'),
                                              Icon(
                                                Icons.content_paste_rounded,
                                                color: Colors.white,
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 30.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  myLogin()),
                                          );
                                        },
                                        child: Text(
                                          '',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      TextButton(
                                          style: ElevatedButton.styleFrom(
                                          maximumSize: const Size(170.0, 90.0),
                                          minimumSize: const Size(170.0, 60.0),
                                          primary: Colors.black,
                                          shape: const StadiumBorder(),
                                         ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  myLogin()),
                                          );
                                        },
                                        child: Text(
                                          'Login Page',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
            }
        ),
      );
  }
}
