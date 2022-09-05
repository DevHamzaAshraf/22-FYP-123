import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:untitled/choosegamescreen.dart';
import 'Instructorlogin.dart';
import 'KidsGameScreen.dart';
import 'login.dart';
import 'package:lottie/lottie.dart';


class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Container(
            height: MediaQuery. of(context). size. height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:[Color(0xff43cea2),Color(0xff185a9d)],
              )
              //   image: DecorationImage(
              //       image: AssetImage('assets/ASD.webp'),
              //       fit: BoxFit.fill
              //   )
            ),
            child: Center(
              child: Column(
                  children: <Widget> [
                    SizedBox(height: 10,),


                    Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 300, 70),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Lottie.network('https://assets10.lottiefiles.com/private_files/lf30_mrxckhcn.json',
                              height: 100,
                              width: 100),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text('Assistere', style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(300, 0, 0, 70),

                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Lottie.network('https://assets10.lottiefiles.com/private_files/lf30_mrxckhcn.json',
                              height: 100,
                              width: 100),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(250, 140 , 0, 0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                                child: Lottie.network('https://assets7.lottiefiles.com/private_files/lf30_cc9cxym5.json', height: 100, width: 100)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(' It is inspired by the need of specific exercises for children with\n '
                                  'Autism Spectrum Disorder focusing on their unique strength and\n difficulty '
                                  'to do simple exercises. Assistere is an invaluable tool for\n people with '
                                  'autism when the words just dont come', style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                letterSpacing: 1,
                                height: 1.5,
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Text(' It is inspired by the need of specific exercises for children with\n '
                    //     'Autism Spectrum Disorder focusing on their unique strength and\n difficulty '
                    //     'to do simple exercises. Assistere is an invaluable tool for\n people with '
                    //     'autism when the words just dont come', style: TextStyle(
                    //   fontSize: 20,
                    //   color: Colors.white,
                    //   letterSpacing: 1,
                    //   height: 1.5,
                    // ),),
                    Lottie.network('https://assets8.lottiefiles.com/private_files/lf30_vcpel21p.json',
                    height: 100,
                    width: 100),

                    SizedBox(height: 30,),
                    //Animated Button Package
                    AnimatedButton(
                      onPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  myLogin()),
                        );
                      },
                      height: 70,
                      width: 200,
                      text: 'IM a Parent' ,
                      textStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white

                      ),
                      isReverse: true,
                      selectedTextColor: Colors.orange,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      backgroundColor: Colors.red,
                      borderColor: Colors.transparent,
                      borderRadius: 20,
                      borderWidth: 2,
                    ),
                    SizedBox(height: 30,),
                    AnimatedButton(
                      onPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  KidChooseGame()),
                        );
                      },
                      height: 70,
                      width: 200,
                      text: 'IM a Child',
                      isReverse: true,
                      textStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white

                      ),
                      selectedTextColor: Colors.orange,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      backgroundColor: Colors.red,
                      borderColor: Colors.transparent,
                      borderRadius: 20,
                      borderWidth: 2,
                    ),


                    SizedBox(height: 30,),
                    AnimatedButton(
                      onPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  InstructorLogin()),
                        );
                      },
                      height: 70,
                      width: 200,
                      text: 'Instructor',
                      isReverse: true,
                      textStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.white

                      ),
                      selectedTextColor: Colors.orange,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      backgroundColor: Colors.red,
                      borderColor: Colors.transparent,
                      borderRadius: 20,
                      borderWidth: 2,
                    ),

                  ],


                ),
              ),
            ),
        ),
      ),
    );
  }
}