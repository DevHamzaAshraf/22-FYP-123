import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserTappingBoardStage2DB extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final String Userid;
  var FirebaseUser =  FirebaseAuth.instance.currentUser;
  UserTappingBoardStage2DB({Key? key, required this.Userid}) : super(key: key);
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
                  Navigator.pop(context);
                },
              )

          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/leaf.jpg'),
                    fit: BoxFit.cover
                )
            ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('TappingBoardStage2').where("Name", isEqualTo: "$Userid").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                return ListView.builder(
                  itemCount: streamSnapshot.data?.docs.length,
                  itemBuilder: (ctx, index) =>
                      Column(
                        children: [
                          SizedBox(height: 150,),
                          Text('Score',style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(streamSnapshot.data?.docs[index]['Score']?? ''),
                          Text('Name',style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(streamSnapshot.data?.docs[index]['Name']?? ''),
                          SizedBox(height: 50,),
                          Text('Starting Time',style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(streamSnapshot.data?.docs[index]['StartTime']?? ''),
                          SizedBox(height: 50,),
                          Text('Ending Time',style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(streamSnapshot.data?.docs[index]['EndTime']?? ''),
                        ],
                      ),

                );

              },

            ),
          )),
    );

  }
}