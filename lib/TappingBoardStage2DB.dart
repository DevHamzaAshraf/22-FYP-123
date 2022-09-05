import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TappingBoardDBStage2 extends StatelessWidget {
  final db = FirebaseFirestore.instance;
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
                  .collection('TappingBoardStage2')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                return ListView.builder(
                  itemCount: streamSnapshot.data?.docs.length,
                  itemBuilder: (ctx, index) =>
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 150,),
                            Text('Name',style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),),
                            Text(streamSnapshot.data?.docs[index]['Name']?? ''),
                            Text('Score',style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),),

                            Text(streamSnapshot.data?.docs[index]['Score']?? ''),
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
                      ),

                );

              },

            ),
          )),
    );

  }
}