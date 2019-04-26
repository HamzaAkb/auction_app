import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:auction_app/pages/drawer.dart';


class MyProducts extends StatelessWidget {
  final FirebaseUser user;

  getData() async {
    return await Firestore.instance.collection('bid').getDocuments();
  }

  const MyProducts({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: new Text('My Products'),
        ),
      ),
      drawer: Drawer(
        child: new Drawerr(user: user),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('bid').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return FirestoreListView(
              documents: snapshot.data.documents, user: user);
        },
      ),
    );
  }
}

class FirestoreListView extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  FirestoreListView({this.documents, this.user});

  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemExtent: 90,
      itemBuilder: (BuildContext context, int index) {
        String title = documents[index].data['name'].toString();
        DateTime endingDate = documents[index].data['ending_date'].toDate();

        if (documents[index].data['userID'] == user.uid) {
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.white),
              ),
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text(title)),
                  Expanded(
                    child: Text(endingDate.toString()),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
    return null;
  }
}
