import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'dart:math';
import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:untitled/choosegamescreen.dart';
import 'package:untitled/Game3Screen3.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Game3Screen2 extends StatefulWidget {
  final int ScoreFromScreen1;
  final String Docid;

  const Game3Screen2({Key? key, required this.ScoreFromScreen1, required this.Docid}) : super(key: key);

  @override
  _Game3Screen2State createState() => _Game3Screen2State(
    ScoreFromScreen1 : this.ScoreFromScreen1,
    Docid: this.Docid
  );
}

class _Game3Screen2State extends State<Game3Screen2> with TickerProviderStateMixin {
  final int ScoreFromScreen1;
  final String Docid;
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
  void SecondTileFn() {
    setState(() {
      SecondTile=false;
    });
  }
  void ThirdTileFn() {
    setState(() {
      ThirdTile=false;
    });
  }
  _Game3Screen2State({required this.ScoreFromScreen1 , required this.Docid});
  @override

  bool singleTap = true;
  bool singleTap2 = true;
  bool singleTap3 = true;
  bool SecondTile=true;
  bool ThirdTile=true;
  double opavalue=1;
  bool decider=false;
  bool decider2=false;
  int nextscreen=0;
  int Databaseval=4;

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
                    FirebaseFirestore.instance.collection('TappingBoard').doc(Docid).update({
                      'Score': Databaseval.toString()
                    });
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
                    child: Circle(colorsq: Colors.yellow),
                  ),
                ),


                Offstage(
                  offstage: SecondTile,
                  child: GestureDetector(
                    onTap: (){
                      Databaseval++;

                      FirebaseFirestore.instance.collection('TappingBoard').doc(Docid).update({
                        'Score': Databaseval.toString()
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
                    alignment: Alignment.centerRight,
                    child: Circle(colorsq: Colors.greenAccent),
                  ),
                ),




                Offstage(
                  offstage: ThirdTile,
                  child: GestureDetector(
                    onTap: (){
                      Databaseval++;
                      int six=6;
                      FirebaseFirestore.instance.collection('TappingBoard').doc(Docid).update({
                        'Score': six.toString()
                      });
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          autoCloseDuration: Duration(seconds: 2),
                          title: 'Congratulations You Cleared Level 2',
                          text: 'Get Ready For The Next Round',
                          confirmBtnText: 'Congratulations',
                          onConfirmBtnTap: ()=>Navigator.pushReplacementNamed(context, ''),
                          loopAnimation: true,
                          backgroundColor: Colors.lightGreenAccent,
                          lottieAsset: 'assets/star.json'
                      );
                      if(singleTap3){
                        setState(() {

                          nextscreen++;


                          if(nextscreen==3){
                            Future.delayed(const Duration(seconds: 3), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Game3Screen3(ScoreFromSecondScreen: six, Docid:  Docid,)),
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

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(80);
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




class Circle extends StatelessWidget {
  final Color  colorsq;
  const Circle({Key? key , required this.colorsq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: colorsq,
          shape: BoxShape.circle
      ),
    );
  }
}
