import 'dart:async';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auction_app/pages/add_product.dart';
import 'package:auction_app/pages/show_search_category.dart';
import 'package:auction_app/pages/login.dart';
import 'package:auction_app/pages/show_products.dart';
import 'package:auction_app/pages/my_products.dart';
import 'package:auction_app/pages/drawer.dart';
import 'package:date_format/date_format.dart';
import 'package:auction_app/pages/product_details.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: new Center(
          child: new Text('Stronzo'),
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new ShowSearchCategory(user: user),
                  ));
            },
          ),
          new IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddProduct(
                          user: user,
                        )),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: new Drawerr(user: user),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('bid').snapshots(),
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
    return GridView.builder(
      itemCount: documents.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (BuildContext context, int index) {
        String title = documents[index].data['name'];
        String url = documents[index].data['image'].toString();
        DateTime endingDate = documents[index].data['ending_date'].toDate();

        // String date = formatDate(
        //     DateTime(endingDate.month, endingDate.day, endingDate.hour,
        //         endingDate.minute, endingDate.second),
        //     [M, ':', dd, ' (', hh, ':', nn, ':', ss, ' )']);

        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Card(
            child: Hero(
              tag: title,
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new ProductDetails(
                              title: title, endingDate: endingDate)),
                    );
                  },
                  child: GridTile(
                      footer: Container(
                          color: Colors.white,
                          child: new Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ),
                              new Text(
                                "${endingDate}",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          )),
                      child: Image.network(url,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
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
