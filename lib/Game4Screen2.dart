import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:untitled/Game4Screen3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/choosegamescreen.dart';
class Game4Screen2 extends StatelessWidget {
  final int failure;
  final String docidb;
  const Game4Screen2({Key? key, required this.failure, required this.docidb}) : super(key: key);

  @override
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
        body: MyStatefulWidget(ScoreFromFirst: failure, docid: docidb,),




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
  final int ScoreFromFirst;
  final String docid;



  const MyStatefulWidget({ Key? key, required this.ScoreFromFirst, required this.docid });

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(
  ScoreFromFirst: this.ScoreFromFirst,
    docid: this.docid
  );
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int width=0;
  late final AudioCache _audioCache;
  final int ScoreFromFirst;
  final String docid;
  _MyStatefulWidgetState({required this.ScoreFromFirst, required this.docid});

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
  int databaseval=2;
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget> [
        Positioned(
          right: 170,
          top: 265,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 13,
            feedback: Container(
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.circle
              ),

              height: 150,
              width: 150,



            ),
            childWhenDragging: Container(
              height: 150,
              width: 150,

                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle
                )

            ),
            child: Container(
              height: 150,
              width: 150,

                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle
                )

            ),
          ),

        ),

        Align(
          alignment: Alignment.centerRight,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 17,
            feedback: Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.circle
              ),
              height: 150,
              width: 150,


            ),
            childWhenDragging: Container(
              height: 150,
              width: 150,

              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.circle
              ),

            ),

            child: Container(
              height: 150,
              width: 150,

              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.circle
              ),

            ),
          ),
        ),

        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 28,
            feedback: Container(
              height: 150,
              width: 150,

              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle
              ),


            ),
            childWhenDragging: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle
              ),

            ),
            child: Container(
              height: 150,
              width: 150,


              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle
              ),

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

              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle
              ),


            ),
            childWhenDragging: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle
              ),

            ),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle
              ),

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
                      color: Colors.cyanAccent,
                      shape: BoxShape.circle,
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
                int total=ScoreFromFirst+fail;
                FirebaseFirestore.instance.collection('BlockMatching').doc(docid).update({
                  "FailedAttempts" : total.toString(),
                  "Score" : databaseval.toString(),
                });
                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    autoCloseDuration: Duration(seconds: 2),
                    title: 'Congratulations You Cleared Level 2',
                    text: 'Get Ready For The Next Round',
                    confirmBtnText: 'Congratulations',
                    onConfirmBtnTap: ()=>Navigator.pushReplacementNamed(context, 'Game4Screen3'),
                    loopAnimation: true,
                    backgroundColor: Colors.lightGreenAccent,
                    lottieAsset: 'assets/celebration.json'
                );
                _audioCache.play('partyhorn.mp3');




                Future.delayed(Duration(seconds: 4), () {


                  Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>  Game4Screen3(failure: total, docidb: docid,)),
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