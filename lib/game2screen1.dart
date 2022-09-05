import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:untitled/game2screen2.dart';
import 'package:untitled/gamescreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'choosegamescreen.dart';
final GlobalKey<ScaffoldMessengerState> snackbarKey =
GlobalKey<ScaffoldMessengerState>();

class Game2screen1 extends StatelessWidget {
  const Game2screen1({Key? key}) : super(key: key);

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

            ]),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/matchinggamebg.jpg"),
              fit: BoxFit.cover,
            ) ,),
          child: SafeArea(
            child:MyStatefulWidget(),
          ),
        ),
      ),
    );
  }
}




class MyStatefulWidget extends StatefulWidget {

  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  late final AudioCache _audioCache;
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  int Fail=0;
  int Sc=2;
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
                    child:Image.asset("assets/triangle.png",fit: BoxFit.contain,),
                  ),
                  childWhenDragging: Container(

                    color: Colors.transparent,


                    child: Image.asset("assets/triangle.png",fit: BoxFit.contain,),

                  ),
                  child: Container(

                    color: Colors.transparent,

                    child: Image.asset("assets/triangle.png",fit: BoxFit.contain,),

                  ),
                ),
              ),

              Flexible(

                child: Draggable<int>(
                  // Data is the value this Draggable stores.
                  data: 15,
                  feedback: Container(
                    color: Colors.transparent,
                    child:Image.asset("assets/star2.png",fit: BoxFit.contain,),
                  ),
                  childWhenDragging: Container(

                    color: Colors.transparent,


                    child: Image.asset("assets/star2.png",fit: BoxFit.contain,),

                  ),
                  child: Container(

                    color: Colors.transparent,

                    child: Image.asset("assets/star2.png",fit: BoxFit.contain,),

                  ),
                ),
              ),

              Flexible(

                child: Draggable<int>(
                  // Data is the value this Draggable stores.
                  data: 17,
                  feedback: Container(
                    color: Colors.transparent,

                    child:Image.asset("assets/circle.png",fit: BoxFit.contain,),
                  ),
                  childWhenDragging: Container(

                    color: Colors.transparent,

                    child: Image.asset("assets/circle.png",fit: BoxFit.contain,),

                  ),

                  child: Container(

                    color: Colors.transparent,

                    child: Image.asset("assets/circle.png",fit: BoxFit.contain,),

                  ),
                ),
              ),

              Flexible(
                child: Draggable<int>(
                  // Data is the value this Draggable stores.
                  data: 28,
                  feedback: Container(
                    color: Colors.transparent,

                    child:Image.asset("assets/square.jpg",fit: BoxFit.contain,),
                  ),
                  childWhenDragging: Container(

                    color: Colors.transparent,

                    child: Image.asset("assets/square.jpg",fit: BoxFit.contain,),

                  ),
                  child: Container(

                    color: Colors.transparent,

                    child: Image.asset("assets/square.jpg",fit: BoxFit.contain,),

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
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>  [

                  Flexible(child: Image.asset("assets/triangle2.png",fit: BoxFit.contain)),
                  SizedBox(width: 30,),
                  Flexible(child: Image.asset("assets/square.jpg",fit: BoxFit.contain)),
                ],
              );


            },
            onWillAccept: (data) => true,
            onAccept: (data) {
              if( data % 2 ==0){
                counter++;
                if(counter==1) {
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
                  final FirebaseAuth auth = FirebaseAuth.instance;

                  final User? user = auth.currentUser;
                  final uid = user?.email;

                  DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, DateTime.now().minute,DateTime.now().second) ;
                  firestoreInstance.collection("MatchingCollection2").doc(firebaseUser?.email).set(
                      {
                        "Name": uid.toString(),
                        "FailedAttempts" : Fail.toString(),
                        "Score" : Sc.toString(),
                        "StartTime" : dateToday.toString(),
                        "EndTime": "Did Not Play Till The End",
                      }).then((_){
                    print("success!");
                  });
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: 'Congratulations You Found Both',
                      text: 'Get Ready For The Next Round',
                      confirmBtnText: 'Congratulations',
                      autoCloseDuration: Duration(seconds: 2),
                      onConfirmBtnTap: ()=>Navigator.pushReplacementNamed(context, 'Game2screen2'),
                      loopAnimation: true,
                      backgroundColor: Colors.lightGreenAccent,
                      lottieAsset: 'assets/celebration.json'
                  );
                  _audioCache.play('partyhorn.mp3');

                  Future.delayed(Duration(seconds: 3), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Game2screen2(failure: Fail,)),
                    );



                    ;}
                  );
                }
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

                }

                );
              }


            },

          ),
        ),
      ],


    );

  }


  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(

              title: Text('Congratulations you Choose Correct'),
              content: RichText(
                text: TextSpan(
                    children: [
                      WidgetSpan(child:Icon( IconData(0xe156, fontFamily: 'MaterialIcons'),
                        color: Colors.green,
                        size:40 ,),
                      ),
                      WidgetSpan(child:Icon( IconData(0xe156, fontFamily: 'MaterialIcons'),
                        color: Colors.green,
                        size:40 ,),
                      ),
                    ]

                ),


              ),

            ),
          );
        });
  }

  void _showMaterialDialog2() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(

              title: Text('Please Choose Again'),
              content: RichText(
                text: TextSpan(
                    children: [
                      WidgetSpan(child:Icon(IconData(0xe16a, fontFamily: 'MaterialIcons'),
                        color: Colors.red,
                        size:40 ,),
                      ),
                      WidgetSpan(child:Icon(IconData(0xe16a, fontFamily: 'MaterialIcons'),
                        color: Colors.red,
                        size:40 ,),
                      ),
                    ]

                ),


              ),

            ),
          );
        });
  }
}