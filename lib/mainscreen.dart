import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'FirstPage.dart';
import 'UserViewDB.dart';
import 'aboutus.dart';
import 'choosegamescreen.dart';


void main() {
  runApp(const Assisttere());
}

class Assisttere extends StatelessWidget {
  const Assisttere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              // image: const DecorationImage(
              //   image: AssetImage('assets/mainscreenbg.jpg'),
              //   fit: BoxFit.cover,
              // ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:[Color(0xff2b5876 ),Color(0xff4e4376)],
                )
            ),
            child: Scaffold(

              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Color(0xff141e30 ),
                title: Text(''),
                actions: <Widget> [
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.info_outline,
                  //     color: Colors.white,
                  //     size: 40,
                  //   ),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) =>  MyApp()),
                  //     );
                  //   },
                  // ),
                  Spacer(flex: 5,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: IconButton(
                      icon: Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Firstpage()),
                        );
                      },
                    ),
                  ),
                ],


              ),
              backgroundColor: Colors.transparent,
              body:Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedText()),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 30,
                        childAspectRatio: (2 / .6),
                        children: <Widget> [



                          Expanded(child: ButtonSquare(btntext: Text('Play Game', style: TextStyle(
                            fontSize: 40,
                            color: Colors.black

                          ),
                          ),
                          ),
                          ),

                          Expanded(child: EvaluateUser(btntext: Text('Evaluate User', style: TextStyle(
                            fontSize: 40,
                            color: Colors.black
                          ),),)),
                        ],

                      ),
                    ),
                  ),
                ],
              ),
            )
            ,
          ),
        )

    );
  }

}

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override

  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {


  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.deepPurple,
      Colors.pink,
      Colors.blue,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 80.0,
      fontFamily: 'Horizon',
    );

    return SizedBox(

      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'Assistere',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            'Assistere',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            'Assistere',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }
}

class ButtonSquare extends StatefulWidget {
  final Text btntext;
  const ButtonSquare({Key? key , required this.btntext}) : super(key: key);

  @override
  State<ButtonSquare> createState() => _ButtonSquareState(
      btntext : this.btntext
  );
}

class _ButtonSquareState extends State<ButtonSquare> {
  final Text btntext;
  _ButtonSquareState({ required this.btntext});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      // width: 300,
      child: Container(

        decoration: BoxDecoration(gradient: LinearGradient(

            colors: [Colors.white, Colors.white])),
        child: ElevatedButton.icon(

          label: btntext,
          icon: Icon(
            Icons.videogame_asset,
            color: Colors.black,
            size: 50.0,
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChooseGame()),
            );
          },

          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: Colors.transparent, shadowColor: Colors.transparent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}


class AboutusButton extends StatelessWidget {
  final Text btntext;
  const AboutusButton({Key? key, required this.btntext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      // width: 300,
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(

            colors: [Colors.blue, Colors.blue])),
        child: ElevatedButton.icon(

          label: btntext,
          icon: Icon(
            Icons.info_outlined,
            color: Colors.black,
            size: 50.0,
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MyApp()),
            );
          },

          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: Colors.transparent, shadowColor: Colors.transparent,
            shape: new RoundedRectangleBorder(

              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}


class EvaluateUser extends StatelessWidget {
  final Text btntext;
  const EvaluateUser({Key? key, required this.btntext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      // width: 300,
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(

            colors: [Colors.white, Colors.white])),
        child: ElevatedButton.icon(

          label: btntext,
          icon: Icon(
            Icons.library_add_check_outlined,
            color: Colors.black,
            size: 50.0,
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  UserDataBaseView()),
            );
          },

          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: Colors.transparent, shadowColor: Colors.transparent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}

class ExitButton extends StatelessWidget {
  final Text btntext;
  const ExitButton({Key? key, required this.btntext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      // width: 300,
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(

            colors: [Colors.blue, Colors.pink])),
        child: ElevatedButton.icon(

          label: btntext,
          icon: Icon(
            Icons.logout_sharp,
            color: Colors.white,
            size: 50.0,
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Firstpage()),
            );
          },

          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: Colors.transparent, shadowColor: Colors.transparent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
