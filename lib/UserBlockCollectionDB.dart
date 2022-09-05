import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class UserBlockMatchingDB extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final String Userid;
  UserBlockMatchingDB({Key? key, required this.Userid}) : super(key: key);
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
                  image: AssetImage("assets/leaf.jpg"),
                  fit: BoxFit.cover,
                )
            ),

            child: StreamBuilder(

              stream: FirebaseFirestore.instance
                  .collection('BlockMatching').where("Name", isEqualTo: "$Userid").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                return ListView.builder(

                  itemCount: streamSnapshot.data?.docs.length,
                  itemBuilder: (ctx, index) =>
                      Column(
                        children: [
                          SizedBox(height: 150,),
                          Text('Name',style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(streamSnapshot.data?.docs[index]['Name']?? ''),
                          Text('End Time', style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(streamSnapshot.data?.docs[index]['EndTime']?? ''),
                          Text('Starting Time', style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(streamSnapshot.data?.docs[index]['StartTime']?? ''),
                          Text('Score', style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(streamSnapshot.data?.docs[index]['Score']?? ''),
                          Text('Number of Failed Attempts', style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(streamSnapshot.data?.docs[index]['FailedAttempts']?? ''),
                        ],
                      ),

                );

              },

            ),
          )),
    );

  }
}