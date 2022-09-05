import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:untitled/gamescreen2.dart';
import 'package:untitled/gamescreen6.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'choosegamescreen.dart';
final GlobalKey<ScaffoldMessengerState> snackbarKey =
GlobalKey<ScaffoldMessengerState>();

class Gamescreen5 extends StatelessWidget {
  final int failure;
  final String docidb;
  const Gamescreen5({Key? key, required this.failure, required this.docidb}) : super(key: key);

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
          actions: <Widget>[
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/matchinggamebg.jpg"),
              fit: BoxFit.cover,
            ) ,),
          child: SafeArea(
            child:MyStatefulWidget(FailledAttemptsFromFourth: failure, docid: docidb,),
    ),
        ),
      ),

    );
  }
}




class MyStatefulWidget extends StatefulWidget {
  final int FailledAttemptsFromFourth;
  final String docid;

  const MyStatefulWidget({Key? key, required this.FailledAttemptsFromFourth, required this.docid}) : super(key: key);

  @override

  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(
      FailledAttemptsFromFourth: this.FailledAttemptsFromFourth,
      docid: this.docid
  );
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final int FailledAttemptsFromFourth;
  final String docid;
  _MyStatefulWidgetState({required this.FailledAttemptsFromFourth, required this.docid});

  late final AudioCache _audioCache;
  final firestoreName = FirebaseFirestore.instance;
  int Fail= 0;
  int  VarScore= 0;
  String score='';
  int databaseval=5;



  @override
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  double h =200;
  double w=200;

  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget> [



        Align(
          alignment: Alignment.centerLeft,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 14,
            feedback: Container(
              child:Image.asset("assets/orange.png", fit: BoxFit.contain, height: 200.0, width: 200.0,),
            ),
            childWhenDragging: Container(




              child: Image.asset("assets/orange.png",fit: BoxFit.contain,height: 200.0, width: 200.0,),

            ),
            child: Container(





              child: Image.asset("assets/orange.png",fit: BoxFit.contain,height: 200, width: 200,

              ),

            ),
          ),
        ),
        SizedBox(width: 20,),
        Align(
          alignment: Alignment.center,
          child: Draggable<int>(

            data: 17,
            feedback: Container(


              child:Image.asset("assets/apple.png",fit: BoxFit.contain,),
            ),
            childWhenDragging: Container(



              child: Image.asset("assets/apple.png",fit: BoxFit.contain,),

            ),

            child: Container(



              child: Image.asset("assets/apple.png",fit: BoxFit.contain,),

            ),
          ),
        ),
        SizedBox(width: 20,),
        Align(
          alignment: Alignment.centerRight,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 29,
            feedback: Container(


                child: Image.asset("assets/mango.png",fit: BoxFit.contain,)
            ),
            childWhenDragging: Container(



              child: Image.asset("assets/mango.png",fit: BoxFit.contain,),

            ),
            child: Container(



              child: Image.asset("assets/mango.png",fit: BoxFit.contain,),

            ),
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
              return Image.asset("assets/orange.png",fit: BoxFit.contain,);
            },
            onWillAccept: (data) => true,
            onAccept: (data) {
              if( data % 2 ==0){
                int  total= FailledAttemptsFromFourth+Fail;
                FirebaseFirestore.instance.collection('MatchingCollection').doc(docid).update({
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
                    onConfirmBtnTap: () =>
                        Navigator.pushReplacementNamed(context, ''),
                    loopAnimation: true,
                    backgroundColor: Colors.lightGreenAccent,
                    lottieAsset: 'assets/celebration.json'
                );
                _audioCache.play('partyhorn.mp3');





                Future.delayed(Duration(seconds: 4), () {


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Gamescreen6(failure: total, docidb: docid,)),
                  );



                  ;}
                );}
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

                  ;});
              }


            },

          ),
        ),
      ],

    );


  }


}


