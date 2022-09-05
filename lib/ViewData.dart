import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:untitled/choosegamescreen.dart';
import 'BlockMatchingDB.dart';
import 'MatchingGame2Data.dart';
import 'MatchingGameData.dart';
import 'TappingBoardDB.dart';
import 'TappingBoardStage2DB.dart';
import 'mainscreen.dart';

class DataBaseView extends StatelessWidget {
  const DataBaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(''),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Assisttere()),
                );
              },
            )

        ),
        body: Container(
          decoration: const BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/viewdb.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child:  Center(
            child: Column(
              children: const <Widget> [
                SizedBox(height: 30,),
                SizedBox(height: 15,),
                Button(),
                SizedBox(height: 15,),
                Button2(),
                SizedBox(height: 15,),
                Button3(),
                SizedBox(height: 15,),
                Button4(),
                SizedBox(height: 15,),
                Button5(),
                SizedBox(height: 15,),
                Button6(),



              ],
            ),
          ),
        ),
      ),




    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MatchingGameDataDb()
        )
        );
      },
      height: 70,
      width: 250,
      text: 'Matching Game',
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
      backgroundColor: Colors.lightBlue,
      borderColor: Colors.lightBlue,
      borderRadius: 50,
      borderWidth: 0,
    );
  }
}


class Button2 extends StatelessWidget {
  const Button2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  MatchingGame2DataDb()));
      },
      height: 70,
      width: 250,
      text: 'Matching Same Shape',
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
      backgroundColor: Colors.lightBlue,
      borderColor: Colors.lightBlue,
      borderRadius: 50,
      borderWidth: 0,
    );
  }
}

class Button3 extends StatelessWidget {
  const Button3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  TappingBoardDB()));
      },
      height: 70,
      width: 250,
      text: 'Tapping Board',
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
      backgroundColor: Colors.lightBlue,
      borderColor: Colors.lightBlue,
      borderRadius: 50,
      borderWidth: 0,
    );
  }
}





class Button4 extends StatelessWidget {
  const Button4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  TappingBoardDBStage2()));
      },
      height: 70,
      width: 250,
      text: 'Tapping Board Stage 2',
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
      backgroundColor: Colors.lightBlue,
      borderColor: Colors.lightBlue,
      borderRadius: 50,
      borderWidth: 0,
    );
  }
}


class Button5 extends StatelessWidget {
  const Button5({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  BlockMatchingDB()));

      },
      height: 70,
      width: 250,
      text: 'Block Matching',
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
      backgroundColor: Colors.lightBlue,
      borderColor: Colors.lightBlue,
      borderRadius: 50,
      borderWidth: 0,
    );
  }
}
class Button6 extends StatelessWidget {
  const Button6({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  Assisttere()));
      },
      height: 70,
      width: 250,
      text: 'Exit',
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
      backgroundColor: Colors.lightBlue,
      borderColor: Colors.lightBlue,
      borderRadius: 50,
      borderWidth: 0,
    );
  }
}























// class NoteList extends StatelessWidget {
//   final db = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ElevatedButton(
//           onPressed: (){},
//           child: StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection('TappingBoardStage2')
//                 .snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//               return ListView.builder(
//                 itemCount: streamSnapshot.data?.docs.length,
//                 itemBuilder: (ctx, index) =>
//                     Column(
//                       children: [
//                         Text('Score'),
//                         Text(streamSnapshot.data?.docs[index]['Score']),
//                         Text('Starting Time'),
//                         Text(streamSnapshot.data?.docs[index]['StartTime']),
//                         Text('Ending Time'),
//                         Text(streamSnapshot.data?.docs[index]['EndTime']),
//                       ],
//                     ),
//
//               );
//
//             },
//
//           ),
//         ));
//
//   }
// }