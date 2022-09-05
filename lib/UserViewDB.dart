import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'UserBlockCollectionDB.dart';
import 'UserMatchingCollection2db.dart';
import 'UserMatchingGameDB.dart';
import 'UserTappingBoardDB.dart';
import 'UserTappingBoardDBStage2.dart';
import 'mainscreen.dart';

class UserDataBaseView extends StatelessWidget {
  const UserDataBaseView({Key? key}) : super(key: key);

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
        final FirebaseAuth auth = FirebaseAuth.instance;

        final User? user = auth.currentUser;
        final nameid = user?.email;
        Navigator.push(context, MaterialPageRoute(builder: (context)=> UserMatchingGameDB(Userid: nameid.toString(),)
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
        final FirebaseAuth auth = FirebaseAuth.instance;

        final User? user = auth.currentUser;
        final nameid = user?.email;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  UserMatchingCollection2DB(Userid: nameid.toString(),)));
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
        final FirebaseAuth auth = FirebaseAuth.instance;

        final User? user = auth.currentUser;
        final nameid = user?.email;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  UserTappingBoardDB(Userid: nameid.toString())));
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
        final FirebaseAuth auth = FirebaseAuth.instance;

        final User? user = auth.currentUser;
        final nameid = user?.email;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  UserTappingBoardStage2DB(Userid: nameid.toString(),)));
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
        final FirebaseAuth auth = FirebaseAuth.instance;

        final User? user = auth.currentUser;
        final nameid = user?.email;


        Navigator.push(context, MaterialPageRoute(builder: (context)=>  UserBlockMatchingDB(Userid: nameid.toString(),)));

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
