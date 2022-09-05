import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:untitled/mainscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/choosegamescreen.dart';
class Game4Screen3 extends StatelessWidget {
  final int failure;
  final String docidb;

  const Game4Screen3({Key? key, required this.failure, required this.docidb}) : super(key: key);

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
        body:


        //CenterSquare(),
        //SizedBox(height: 120),
        MyStatefulWidget(ScorefromSecond: failure, docid: docidb,),




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
  final int ScorefromSecond;
  final String docid;



  const MyStatefulWidget({ Key? key, required this.ScorefromSecond, required this.docid });

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(
    ScorefromSecond: this.ScorefromSecond,
    docid: this.docid


  );
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int width=0;
  late final AudioCache _audioCache;
  final int ScorefromSecond;
  final String docid;


  _MyStatefulWidgetState({Key? key, required this.ScorefromSecond, required this.docid });
  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }
  int fail=0;
  int databaseval=3;
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget> [
        Positioned(
          right: 170,
          top: 285,
          child: Draggable<int>(
            data: 13,
            feedback: Container(
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.rectangle
              ),

              height: 100,
              width: 150,



            ),
            childWhenDragging: Container(
                height: 100,
                width: 150,

                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.rectangle
                )

            ),
            child: Container(
                height: 100,
                width: 150,

                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.rectangle
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
                  shape: BoxShape.rectangle
              ),
              height: 100,
              width: 150,


            ),
            childWhenDragging: Container(
              height: 100,
              width: 150,

              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.rectangle
              ),

            ),

            child: Container(
              height: 100,
              width: 150,

              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.rectangle
              ),

            ),
          ),
        ),

        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 29,
            feedback: Container(
              height: 100,
              width: 150,

              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.rectangle
              ),


            ),
            childWhenDragging: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.rectangle
              ),

            ),
            child: Container(
              height: 100,
              width: 150,


              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.rectangle
              ),

            ),
          ),
        ),

        Positioned(
          left: 170,
          top: 285,
          child: Draggable<int>(
            // Data is the value this Draggable stores.
            data: 28,
            feedback: Container(
              height: 100,
              width: 150,

              decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.rectangle
              ),


            ),
            childWhenDragging: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.rectangle
              ),

            ),
            child: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.rectangle
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
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.brown,
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
                int total=ScorefromSecond+fail;
                FirebaseFirestore.instance.collection('BlockMatching').doc(docid).update({
                  "Score" : databaseval.toString(),
                  "FailedAttempts" :total.toString() ,
                  "EndTime" : dateToday.toString()
                });

                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    autoCloseDuration: Duration(seconds: 3),
                    title: 'Congratulations You Have Cleared All The Levels. Good Job',
                    text: 'You Did Well. Thanks For Playing',
                    confirmBtnText: 'Congratulations',
                    onConfirmBtnTap: ()=>Navigator.pushReplacementNamed(context, 'Assisttere'),
                    loopAnimation: true,
                    backgroundColor: Colors.lightGreenAccent,
                    lottieAsset: 'assets/celebration.json'
                );
                _audioCache.play('partyhorn.mp3');




                Future.delayed(Duration(seconds: 4), () {


                  Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const Assisttere()),
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