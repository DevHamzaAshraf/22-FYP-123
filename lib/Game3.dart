import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'dart:math';
import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:untitled/Game3Screen2.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/choosegamescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Game3 extends StatefulWidget {

  const Game3({Key? key}) : super(key: key);

  @override
  _Game3State createState() => _Game3State();
}

class _Game3State extends State<Game3> with TickerProviderStateMixin {
  void _incrementCounter() {
    setState(() {
      decider=true;
    });
  }
  void _absfunction() {
    setState(() {
      SecondTile=false;
    });
  }
  void _absfunction2() {
    setState(() {
      ThirdTile=false;
    });
  }
  void BlipAni() {
    setState(() {
      decider2=true;
    });
  }
  final firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  bool singleTap = true;
  bool singleTap2 = true;
  bool singleTap3 = true;
  bool abs=true;
  bool SecondTile=true;
  bool ThirdTile=true;

  double opavalue=1;
  bool decider=false;
  bool decider2=false;
  int nextscreen=0;
  int Databaseval=1;
  String uid="";
  String savedocid="";


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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ChooseGame()),
                );
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

              children: <Widget>[


                GestureDetector(
                  onTap: (){
                    final FirebaseAuth auth = FirebaseAuth.instance;

                    final User? user = auth.currentUser;
                    final nameid = user?.email;



                    DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, DateTime.now().minute,DateTime.now().second) ;

                    FirebaseFirestore.instance.collection('TappingBoard').add({
                      "Name": nameid.toString(),
                      "EndTime": "Did Not Played Till the End",
                      "Score" : Databaseval.toString(),
                      "StartTime" : dateToday.toString(),
                    }).then((value) =>(
                        savedocid=value.id
                    )
                    );
                    if(singleTap) {

                      setState(() {
                        print(savedocid);
                        nextscreen++;
                        singleTap=false;
                        _incrementCounter();
                        _absfunction();
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
                    child: Square(opa: opavalue, colorsq: Colors.yellow,condition: abs,),
                  ),
                ),


                Offstage(
                  offstage: SecondTile,
                  child: GestureDetector(
                    onTap: (){
                      Databaseval++;

                      FirebaseFirestore.instance.collection('TappingBoard').doc(savedocid).update({
                        'Score': Databaseval.toString()
                      });
                      if(singleTap2){
                        setState(() {
                          nextscreen++;
                          singleTap2=false;
                          BlipAni();
                          _absfunction2();
                        });
                      }
                    },
                    child: Align(

                      alignment: Alignment.center,
                      child: SecondBox(Colors.yellow,0.0,1),
                    ),
                  ),
                ),

                Offstage(
                  offstage: decider2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Square2(opa: opavalue, colorsq: Colors.greenAccent,condition:abs ,),
                  ),
                ),




                Offstage(
                  offstage: ThirdTile,
                  child: GestureDetector(
                    onTap: (){
                      nextscreen++;

                      FirebaseFirestore.instance.collection('TappingBoard').doc(savedocid).update({
                        'Score': nextscreen.toString()
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
                      if(singleTap3){
                        setState(() {




                          if(nextscreen==3){
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Game3Screen2(ScoreFromScreen1: nextscreen, Docid: savedocid,)),
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
          if(singletap){
            setState(() {
              singletap=false;
              decidefalse=true;
              _width = 150;
              _height = 150;
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

            alignment: AlignmentDirectional.topStart,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: boxcolor,
              borderRadius: _borderRadius,
            ),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );




  }
}




class SecondBox extends StatefulWidget {
  final Color boxcolor;
  final double val1;
  final double val2;
  const SecondBox(this.boxcolor, this.val1, this.val2);

  @override
  _SecondBoxState createState() => _SecondBoxState(
      boxcolor: this.boxcolor,
      val1: this.val1,
      val2: this.val2
  );
}

class _SecondBoxState extends State<SecondBox> with TickerProviderStateMixin {
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

  Color boxcolor;
  double val1;

  double val2;

  bool decidefalse= false;

  bool singletap=true;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  _SecondBoxState({ required this.boxcolor, required this.val1 , required this.val2});
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
          if(singletap){
            setState(() {
              singletap=false;
              decidefalse=true;
              _width = 150;
              _height = 150;
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

            alignment: AlignmentDirectional.topStart,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: boxcolor,
              borderRadius: _borderRadius,
            ),
            duration: const Duration(seconds: 1),
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
  final bool condition;
  const Square({Key? key, required this.opa, required this.colorsq,required this.condition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: condition,
      child: Container(

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
      ),
    );
  }
}

class Square2 extends StatelessWidget {
  final double opa;
  final Color  colorsq;
  final bool condition;
  const Square2({Key? key, required this.opa, required this.colorsq,required this.condition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: condition,
      child: Container(

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
      ),
    );
  }
}


