import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:untitled/game2screen4.dart';
import 'package:untitled/gamescreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'choosegamescreen.dart';
final GlobalKey<ScaffoldMessengerState> snackbarKey =
GlobalKey<ScaffoldMessengerState>();

class Game2screen3 extends StatelessWidget {
  final int failure;
  const Game2screen3({Key? key, required this.failure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackbarKey,
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
        backgroundColor: Colors.transparent,
        body:
           Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/matchinggamebg.jpg"),
                fit: BoxFit.cover,
              ) ,),
            child: SafeArea(
              child: MyStatefulWidget(ScoreFromsecondscreen: failure,),
     ),
          ),




      ),

    );
  }
}




class MyStatefulWidget extends StatefulWidget {
  final int ScoreFromsecondscreen;


  const MyStatefulWidget({Key? key, required this.ScoreFromsecondscreen}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(
    AttemptedFailFromScreen2: this.ScoreFromsecondscreen
  );
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final int AttemptedFailFromScreen2;
  _MyStatefulWidgetState({required this.AttemptedFailFromScreen2});

  late final AudioCache _audioCache;
  int Fail=0;
  int databaseval=6;
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }
  int counter=0;
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget> [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [


                    Flexible(
                      child: Draggable<int>(
                        // Data is the value this Draggable stores.
                        data: 12,
                        feedback: Container(
                          color: Colors.transparent,


                          child:Image.asset("assets/plus.png",fit: BoxFit.contain,),
                        ),
                        childWhenDragging: Container(

                          color: Colors.transparent,


                            child: Image.asset("assets/plus.png",fit: BoxFit.contain,),

                        ),
                        child: Container(

                          color: Colors.transparent,

                            child: Image.asset("assets/plus.png",fit: BoxFit.contain,),

                        ),
                      ),
                    ),

                Flexible(
                      child: Draggable<int>(
                        // Data is the value this Draggable stores.
                        data: 18,
                        feedback: Container(
                          color: Colors.transparent,

                          child:Image.asset("assets/pentagon.png",fit: BoxFit.contain,),
                        ),
                        childWhenDragging: Container(

                          color: Colors.transparent,

                            child: Image.asset("assets/pentagon.png",fit: BoxFit.contain,),

                        ),

                        child: Container(

                          color: Colors.transparent,

                            child: Image.asset("assets/pentagon.png",fit: BoxFit.contain,),

                        ),
                      ),
                    ),

                Flexible(
                      child: Draggable<int>(
                        // Data is the value this Draggable stores.
                        data: 27,
                        feedback: Container(
                          color: Colors.transparent,

                          child:Image.asset("assets/cone.png",fit: BoxFit.contain,),
                        ),
                        childWhenDragging: Container(

                          color: Colors.transparent,

                            child: Image.asset("assets/cone.png",fit: BoxFit.contain,),

                        ),
                        child: Container(

                          color: Colors.transparent,

                            child: Image.asset("assets/cone.png",fit: BoxFit.contain,),

                        ),
                      ),
                    ),

                Flexible(
                  child: Draggable<int>(
                    // Data is the value this Draggable stores.
                    data: 27,
                    feedback: Container(
                      color: Colors.transparent,

                      child:Image.asset("assets/diamond.png",fit: BoxFit.contain,),
                    ),
                    childWhenDragging: Container(

                      color: Colors.transparent,

                        child: Image.asset("assets/diamond.png",fit: BoxFit.contain,),

                    ),
                    child: Container(

                      color: Colors.transparent,

                        child: Image.asset("assets/diamond.png",fit: BoxFit.contain,),

                    ),
                  ),
                ),

              ],


          ),
        ),


              Align(
                alignment: Alignment.bottomCenter,
                child: DragTarget<int>(
                  builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                      ) {
                    return
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Image.asset("assets/pentagon2.png",fit: BoxFit.contain,)),
                          SizedBox(width: 30,),
                          Flexible(child: Image.asset("assets/plus.png",fit: BoxFit.contain,)),

                        ],
                      );


                  },
                  onWillAccept: (data) => true,
                  onAccept: (data) {
                    if( data % 2 ==0){
                      counter++;
                      if(counter==1){
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            autoCloseDuration: Duration(seconds: 2),
                            title: 'Congratulations Just One More to Go',
                            text: 'Look Around You Can Find it',
                            confirmBtnText: 'One More To Go',
                            onConfirmBtnTap: ()=>Navigator.pushReplacementNamed(context, ''),
                            loopAnimation: true,
                            backgroundColor: Colors.lightGreenAccent,
                            lottieAsset: 'assets/confetti.json'
                        );
                        _audioCache.play('partyhorn.mp3');
                      }

                     if(counter==2){
                       int total=AttemptedFailFromScreen2+Fail;
                       firestoreInstance.collection("MatchingCollection2").doc(firebaseUser?.email).update({"Score" : databaseval.toString(),"FailedAttempts" : total.toString()}).
                       then((_){
                         print("sucess");

                       });
                       CoolAlert.show(
                           context: context,
                           type: CoolAlertType.success,
                           title: 'Congratulations You Found Both',
                           text: 'Get Ready For The Next Round',
                           confirmBtnText: 'Congratulations',
                           autoCloseDuration: Duration(seconds: 3),
                           onConfirmBtnTap: ()=>Navigator.pushReplacementNamed(context, 'Game2screen4'),
                           loopAnimation: true,
                           backgroundColor: Colors.lightGreenAccent,
                           lottieAsset: 'assets/celebration.json'
                       );
                       _audioCache.play('partyhorn.mp3');



                       Future.delayed(Duration(seconds: 4), () {

                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  Game2screen4(failure: total,)),
                         );



                         ;}
                       );}
                     }

                    else {
                      Fail++;
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

                        ;}

                      );
                    }


                  },

                ),
              ),

      ],
    );

  }

}