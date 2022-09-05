import 'package:flutter/material.dart';

import 'BlockMatchingTutorial.dart';
import 'MatchingShapeTutorial.dart';
import 'MatchingTutorial.dart';
import 'TappingBoardStage2Tutorial.dart';
import 'TappingBoardTutorial.dart';
import 'mainscreen.dart';


class ChooseGame extends StatelessWidget {
  const ChooseGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
                image: AssetImage('assets/pac.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child:  Center(
            child: Column(
              children: const <Widget> [
                SizedBox(height: 30,),
                Text("Choose Your Game", style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),

                SizedBox(height: 15,),
                Button(),
                SizedBox(height: 15,),
                Button3(),
                SizedBox(height: 15,),
                Button4(),
                SizedBox(height: 15,),
                Button6(),

                SizedBox(height: 15,),
                Button5(),


              ],
            ),
          ),
        ),
      ),




    );
  }
}

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  MatchingTutorial()),
          );



        }, //This prop for beautiful expressions
        child: const Text(
            "Match Same Image"), // This child can be everything. I want to choose a beautiful Text Widget
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          minimumSize: const Size(200, 100),
          primary: Colors.blue,
          onPrimary: Colors.white,
          onSurface: Colors.blue,
          shadowColor: Colors.grey,
          elevation: 5,
          side: BorderSide(
              color: Colors.blueAccent.shade400, //change border color
              width: 2, //change border width
              style: BorderStyle
                  .solid), // change border side of this beautiful button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30), //change border radius of this beautiful button thanks to BorderRadius.circular function
          ),
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}





class Button2 extends StatelessWidget {
  const Button2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Assisttere()),
          );
        }, //This prop for beautiful expressions
        child: const Text(
            "Go Back"), // This child can be everything. I want to choose a beautiful Text Widget
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          minimumSize: const Size(200, 100), //change size of this beautiful button
          // We can change style of this beautiful elevated button thanks to style prop
          primary: Colors.blue, // we can set primary color
          onPrimary: Colors.white, // change color of child prop
          onSurface: Colors.blue, // surface color
          shadowColor: Colors
              .grey, //shadow prop is a very nice prop for every button or card widgets.
          elevation: 5, // we can set elevation of this beautiful button
          side: BorderSide(
              color: Colors.blueAccent.shade400, //change border color
              width: 2, //change border width
              style: BorderStyle
                  .solid), // change border side of this beautiful button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30), //change border radius of this beautiful button thanks to BorderRadius.circular function
          ),
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}

class Button3 extends StatelessWidget {
  const Button3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  MatchingShapeTutorial()),
          );
        }, //This prop for beautiful expressions
        child: const Text(
            "Choose Same Shape"), // This child can be everything. I want to choose a beautiful Text Widget
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          minimumSize: const Size(200, 100), //change size of this beautiful button
          // We can change style of this beautiful elevated button thanks to style prop
          primary: Colors.blue, // we can set primary color
          onPrimary: Colors.white, // change color of child prop
          onSurface: Colors.blue, // surface color
          shadowColor: Colors
              .grey, //shadow prop is a very nice prop for every button or card widgets.
          elevation: 5, // we can set elevation of this beautiful button
          side: BorderSide(
              color: Colors.blueAccent.shade400, //change border color
              width: 2, //change border width
              style: BorderStyle
                  .solid), // change border side of this beautiful button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30), //change border radius of this beautiful button thanks to BorderRadius.circular function
          ),
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}

class Button4 extends StatelessWidget {
  const Button4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  TutorialTappingBoard()),
          );
        }, //This prop for beautiful expressions
        child: const Text(
            "Tapping Board"), // This child can be everything. I want to choose a beautiful Text Widget
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          minimumSize: const Size(200, 100), //change size of this beautiful button
          // We can change style of this beautiful elevated button thanks to style prop
          primary: Colors.blue, // we can set primary color
          onPrimary: Colors.white, // change color of child prop
          onSurface: Colors.blue, // surface color
          shadowColor: Colors
              .grey, //shadow prop is a very nice prop for every button or card widgets.
          elevation: 5, // we can set elevation of this beautiful button
          side: BorderSide(
              color: Colors.blueAccent.shade400, //change border color
              width: 2, //change border width
              style: BorderStyle
                  .solid), // change border side of this beautiful button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30), //change border radius of this beautiful button thanks to BorderRadius.circular function
          ),
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}

class Button5 extends StatelessWidget {
  const Button5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  BlockMatchingTutorial()),
          );
        }, //This prop for beautiful expressions
        child: const Text(
            "Block Matching"), // This child can be everything. I want to choose a beautiful Text Widget
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          minimumSize: const Size(200, 100), //change size of this beautiful button
          // We can change style of this beautiful elevated button thanks to style prop
          primary: Colors.blue, // we can set primary color
          onPrimary: Colors.white, // change color of child prop
          onSurface: Colors.blue, // surface color
          shadowColor: Colors
              .grey, //shadow prop is a very nice prop for every button or card widgets.
          elevation: 5, // we can set elevation of this beautiful button
          side: BorderSide(
              color: Colors.blueAccent.shade400, //change border color
              width: 2, //change border width
              style: BorderStyle
                  .solid), // change border side of this beautiful button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30), //change border radius of this beautiful button thanks to BorderRadius.circular function
          ),
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}

class Button6 extends StatelessWidget {
  const Button6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  TutorialTappingBoardStage2()),
          );
        }, //This prop for beautiful expressions
        child: const Text(
            "Tapping Board Stage 2"), // This child can be everything. I want to choose a beautiful Text Widget
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          minimumSize: const Size(200, 100), //change size of this beautiful button
          // We can change style of this beautiful elevated button thanks to style prop
          primary: Colors.blue, // we can set primary color
          onPrimary: Colors.white, // change color of child prop
          onSurface: Colors.blue, // surface color
          shadowColor: Colors
              .grey, //shadow prop is a very nice prop for every button or card widgets.
          elevation: 5, // we can set elevation of this beautiful button
          side: BorderSide(
              color: Colors.blueAccent.shade400, //change border color
              width: 2, //change border width
              style: BorderStyle
                  .solid), // change border side of this beautiful button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30), //change border radius of this beautiful button thanks to BorderRadius.circular function
          ),
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}



