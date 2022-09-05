import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:cool_alert/cool_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Game3Stage2Screen2.dart';
import 'choosegamescreen.dart';

class Game3Stage2 extends StatefulWidget {

  const Game3Stage2({Key? key}) : super(key: key);

  @override
  _Game3Stage2State createState() => _Game3Stage2State();
}

class _Game3Stage2State extends State<Game3Stage2> with TickerProviderStateMixin {
  void _incrementCounter() {
    setState(() {
      decider=true;
    });
  }
  void BlipAni() {
    setState(() {
      decider2=true;
    });
  }
  void BlipAni2() {
    setState(() {
      decider3=true;
    });
  }

  void SecondTileFn() {
    setState(() {
      SecondTile=false;
    });
  }
  void ThirdTileFn() {
    setState(() {
      ThirdTile=false;
    });
  } void FourthTileFn() {
    setState(() {
      FourthTile=false;
    });
  }

  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  String savedocid="";
  bool singleTap = true;
  bool singleTap2 = true;
  bool singleTap3 = true;
  bool singleTap4=true;
  bool SecondTile=true;
  bool ThirdTile=true;
  bool FourthTile=true;
  double opavalue=1;
  bool decider=false;
  bool decider2=false;
  bool decider3=false;
  int nextscreen=0;
  int DataBaseVal=1;


  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(''),
          actions: <Widget> [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Spacer(flex: 5,),
            IconButton(
              icon: Icon(
                Icons.cancel_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ChooseGame()),
                );
              },
            ),
          ],

        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/chalk.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Stack(
            // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[


                GestureDetector(
                  onTap: (){
                    DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, DateTime.now().minute,DateTime.now().second) ;
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final User? user = auth.currentUser;
                    final nameid = user?.email;

                    FirebaseFirestore.instance.collection('TappingBoardStage2').add({
                      "Name": nameid.toString(),
                      "Score" : DataBaseVal.toString(),
                      "StartTime" : dateToday.toString(),
                      "EndTime": "Did Not Play Till the End",
                    }).then((value) =>(
                        savedocid=value.id
                    )
                    );

                    if(singleTap) {
                      setState(() {
                        nextscreen++;
                        singleTap=false;
                        _incrementCounter();
                        SecondTileFn();
                      });
                    }
                  },
                  child: Align(

                    alignment: Alignment.centerLeft,
                    child: AnimatedContainerApp2(Colors.red,0.0,1),
                  ),
                ),

                Offstage(
                  offstage: decider,
                  child: Align(
                    alignment: Alignment.center,
                    child: Square(opa: opavalue, colorsq: Colors.yellow,),
                  ),
                ),


                Offstage(
                  offstage: SecondTile,
                  child: GestureDetector(
                    onTap: (){
                      DataBaseVal++;
                      FirebaseFirestore.instance.collection('TappingBoardStage2').doc(savedocid).update({
                        "Score" : DataBaseVal.toString()
                      });

                      if(singleTap2){
                        setState(() {
                          nextscreen++;
                          singleTap2=false;
                          BlipAni();
                          ThirdTileFn();
                        });
                      }
                    },
                    child: Align(

                      alignment: Alignment.center,
                      child: AnimatedContainerApp2(Colors.yellow,0.0,1),
                    ),
                  ),
                ),

                Offstage(
                  offstage: decider2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Square(opa: opavalue, colorsq: Colors.greenAccent,),
                  ),
                ),




                Offstage(
                  offstage: ThirdTile,
                  child: GestureDetector(
                    onTap: (){
                      DataBaseVal++;
                      FirebaseFirestore.instance.collection('TappingBoardStage2').doc(savedocid).update({
                        "Score" : DataBaseVal.toString()
                      });

                      if(singleTap3){
                        setState(() {
                          nextscreen++;
                          singleTap3=false;
                          BlipAni2();
                          FourthTileFn();
                        });
                      }
                    },
                    child: Align(

                      alignment: Alignment.topCenter,
                      child: AnimatedContainerApp2(Colors.lightGreenAccent,0.0,1),
                    ),
                  ),
                ),

                Offstage(
                  offstage: decider3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Square(opa: opavalue, colorsq: Colors.greenAccent,),
                  ),
                ),








                Offstage(
                  offstage: FourthTile,
                  child: GestureDetector(
                    onTap: (){
                      DataBaseVal++;
                      FirebaseFirestore.instance.collection('TappingBoardStage2').doc(savedocid).update({
                        "Score" : DataBaseVal.toString()
                      });


                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          autoCloseDuration: Duration(seconds: 2),
                          title: 'Congratulations You Cleared Level 1',
                          text: 'Get Ready For The Next Round',
                          confirmBtnText: 'Congratulations',
                          onConfirmBtnTap: ()=>Navigator.pushReplacementNamed(context, ''),
                          loopAnimation: true,
                          backgroundColor: Colors.lightGreenAccent,
                          lottieAsset: 'assets/star.json'
                      );
                      if(singleTap4){
                        setState(() {

                          nextscreen++;


                          if(nextscreen==4){
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Game3Screen2Stage2HA(docidb: savedocid)),
                              );
                            });
                          }
                        });
                      }
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedContainerApp2(Colors.greenAccent,0.0,1),
                    ),
                  ),
                ),








              ]
          ),
        ),
      ),
    );


  }
}
class AnimatedContainerApp2 extends StatefulWidget {
  final Color boxcolor;
  final double val1;
  final double val2;
  const AnimatedContainerApp2(this.boxcolor, this.val1, this.val2);

  @override
  _AnimatedContainerApp2State createState() => _AnimatedContainerApp2State(
      boxcolor: this.boxcolor,
      val1: this.val1,
      val2: this.val2
  );
}

class _AnimatedContainerApp2State extends State<AnimatedContainerApp2> with TickerProviderStateMixin {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,

    curve: Interval(val1, val2, curve: Curves.easeIn),
  );

  double _width = 150;
  double _height = 150;
  Color _color = Colors.green;
  Color boxcolor;
  double val1;
  double val2;
  bool decidefalse= false;
  bool singletap=true;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  _AnimatedContainerApp2State({ required this.boxcolor, required this.val1 , required this.val2});
  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return  AbsorbPointer(
      absorbing: decidefalse,

      child: GestureDetector(
        onTap: () {
          // Use setState to rebuild the widget with new values.
          if(singletap){
            setState(() {
              singletap=false;


              decidefalse=true;
              // Create a random number generator.
              final random = Random();

              // Generate a random width and height.
              _width = 150;
              _height = 150;

              // Generate a random color.


              // Generate a random border radius.

              Future.delayed(const Duration(seconds: 1), () {
                _controller.forward();
              });

            }
            );
          }

        },


        child:  FadeTransition(
          opacity: _animation,


          child: AnimatedContainer(
            // Use the properties stored in the State class.
            alignment: AlignmentDirectional.topStart,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: boxcolor,
              borderRadius: _borderRadius,
            ),
            // Define how long the animation should take.

            duration: const Duration(seconds: 1),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );




  }
}

class Square extends StatelessWidget {
  final double opa;
  final Color  colorsq;
  const Square({Key? key, required this.opa, required this.colorsq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 150.0,
      color: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(

              color:colorsq.withOpacity(opa),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: new Center(
            child: new Text("",
              style: TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,),
          )),
    );
  }
}



