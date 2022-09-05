import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:untitled/Game4Screen2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/choosegamescreen.dart';
class Game4 extends StatelessWidget {
  const Game4({Key? key}) : super(key: key);
  Future<bool> _onWillPop() async {
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
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
          body: MyStatefulWidget(),




        ),
      ),
    );
  }
}

class CenterSquare extends StatelessWidget {
  const CenterSquare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(seconds: 1),
      slidingCurve: Curves.easeInOutCubicEmphasized,
      fadingDuration: Duration(seconds: 3),
      slidingBeginOffset: const Offset(2,0.20),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8,
                offset: Offset(5, 10), // Shadow position
              ),
            ]
        ),

      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {



  const MyStatefulWidget({ Key? key });

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(


  );
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int width=0;
  late final AudioCache _audioCache;



  _MyStatefulWidgetState({Key? key });
  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }
  final firestoreInstance = FirebaseFirestore.instance;
  int fail=0;
  final firestoreName = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  int databaseval=1;
  String savedocid="";
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget> [
        Positioned(
          right: 170,
          top: 265,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 12,
            feedback: Container(
              color: Colors.deepOrange,
              height: 150,
              width: 150,



            ),
            childWhenDragging: Container(
              height: 150,
              width: 150,

              color: Colors.deepOrange,
              child: Center(


              ),
            ),
            child: Container(
              height: 150,
              width: 150,

              color: Colors.deepOrange,
              child:  Center(

              ),
            ),
          ),

        ),

        Align(
          alignment: Alignment.centerRight,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 17,
            feedback: Container(
              color: Colors.blueGrey,
              height: 150,
              width: 150,


            ),
            childWhenDragging: Container(
              height: 150,
              width: 150,

              color: Colors.blueGrey,

            ),

            child: Container(
              height: 150,
              width: 150,

              color: Colors.blueGrey,

            ),
          ),
        ),

        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 27,
            feedback: Container(
              height: 150,
              width: 150,

              color: Colors.yellowAccent,


            ),
            childWhenDragging: Container(
              height: 150,
              width: 150,
              color: Colors.yellowAccent,

            ),
            child: Container(
              height: 150,
              width: 150,


              color: Colors.yellowAccent,

            ),
          ),
        ),

        Positioned(
          left: 170,
          top: 265,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 27,
            feedback: Container(
              height: 150,
              width: 150,

              color: Colors.deepPurple,


            ),
            childWhenDragging: Container(
              height: 150,
              width: 150,
              color: Colors.deepPurple,

            ),
            child: Container(
              height: 150,
              width: 150,


              color: Colors.deepPurple,

            ),
          ),
        ),




        SizedBox(height: 50,),
        Align(
          alignment: Alignment.topCenter,
          child: DragTarget<int>(
            builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
                ) {
              return DelayedDisplay(
                delay: Duration(seconds: 1),
                slidingCurve: Curves.easeInOutCubicEmphasized,
                fadingDuration: Duration(seconds: 3),
                slidingBeginOffset: const Offset(2,0.20),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 8,
                          offset: Offset(5, 10), // Shadow position
                        ),
                      ]
                  ),

                ),
              );
            },
            onWillAccept: (data) => true,
            onAccept: (data) {
              if( data % 2 ==0){


                DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, DateTime.now().minute,DateTime.now().second) ;

                final FirebaseAuth auth = FirebaseAuth.instance;

                final User? user = auth.currentUser;
                final nameid = user?.email;

                FirebaseFirestore.instance.collection('BlockMatching').add({
                  "Name": nameid.toString(),
                  "FailedAttempts" : fail.toString(),
                  "Score" : databaseval.toString(),
                  "StartTime" : dateToday.toString(),
                  "EndTime": "Did Not Play Till the End",
                }).then((value) =>(
                    savedocid=value.id
                )
                );


                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    autoCloseDuration: Duration(seconds: 2),
                    title: 'Congratulations You Cleared Level 1',
                    text: 'Get Ready For The Next Round',
                    confirmBtnText: 'Congratulations',
                    onConfirmBtnTap: ()=>Navigator.pushReplacementNamed(context, 'Game4Screen2'),
                    loopAnimation: true,
                    backgroundColor: Colors.lightGreenAccent,
                    lottieAsset: 'assets/celebration.json'

                );
                _audioCache.play('partyhorn.mp3');




                Future.delayed(Duration(seconds: 4), () {


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Game4Screen2(failure: fail, docidb: savedocid,)),
                  );



                  ;}
                );}
              else {
                fail++;
                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    title: 'It Seems You Choose Incorrectly',
                    text: 'Good luck, Dont Give Up Have Another Try',
                    loopAnimation: true,
                    backgroundColor: Colors.white,
                    lottieAsset: 'assets/wrong.json'
                );

                _audioCache.play('wrong.mp3');

                Future.delayed(Duration(seconds: 1), () {

                  ;});
              }


            },

          ),
        ),
      ],


    );

  }

}