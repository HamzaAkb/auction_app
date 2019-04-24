import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home ${user.email}'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Hamza Akbar'),
              accountEmail: Text('${user.email}'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // IMPLEMENTATION
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                // IMPLEMENTATION.
              },
            ),
            ListTile(
              title: Text('My Bids'),
              onTap: () {},
            ),
            ListTile(
              title: Text('My Products'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Categories'),
              onTap: () {},
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('user').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return FirestoreListView(documents: snapshot.data.documents);
        },
      ),
    );
  }
}

class FirestoreListView extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  FirestoreListView({this.documents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemExtent: 90,
      itemBuilder: (BuildContext context, int index) {
        String title = documents[index].data['name'].toString();

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
              ],
            ),
          ),
        );
      },
    );
    return null;
  }
}

//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: Firestore.instance
//             .collection('CRUD')
//             .document(user.uid)
//             .snapshots(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (snapshot.hasData) {
//             return checkRole(snapshot.data);
//           }
//           return LinearProgressIndicator();
//         },
//       ),
//     );
//   }

//   Center checkRole(DocumentSnapshot snapshot) {
//     if (snapshot.data == null) {
//       return Center(
//         child: Text('no data set in the userId document in firestore'),
//       );
//     }
//     if (snapshot.data['name'] == 'Hamza') {
//       return adminPage(snapshot);
//     } else {
//       return userPage(snapshot);
//     }
//   }

//   Center adminPage(DocumentSnapshot snapshot) {
//     return Center(
//         child: Text('${snapshot.data['name']}'));
//   }

//   Center userPage(DocumentSnapshot snapshot) {
//     return Center(child: Text(snapshot.data['name']));
//   }
// }
