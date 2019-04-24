// import 'package:flutter/material.dart';

// class Drawerr extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Drawerr(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the Drawer if there isn't enough vertical
//         // space to fit everything.
//         ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             new UserAccountsDrawerHeader(
//               accountName: Text('Hamza Akbar'),
//               accountEmail: Text('hamzawakbar@gmail.com'),
//               currentAccountPicture: GestureDetector(
//                 child: new CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   child: Icon(Icons.person, color: Colors.white),
//                 ),
//               ),
//               decoration: new BoxDecoration(
//                 color: Colors.black,
//               ),
//             ),
//             ListTile(
//               title: Text('Home'),
//               onTap: () {
//                 // IMPLEMENTATION
//               },
//             ),
//             ListTile(
//               title: Text('Notifications'),
//               onTap: () {
//                 // IMPLEMENTATION.
//               },
//             ),
//             ListTile(
//               title: Text('My Bids'),
//               onTap: () {},
//             ),
//             ListTile(
//               title: Text('My Products'),
//               onTap: () {},
//             ),
//             ListTile(
//               title: Text('Categories'),
//               onTap: () {},
//             ),
//             Divider(
//               color: Colors.black,
//             ),
//             ListTile(
//               title: Text('About Us'),
//               onTap: () {},
//             ),
//             Divider(
//               color: Colors.black,
//             ),
//             ListTile(
//               title: new Text('Log Out'),
//               onTap: () {},
//             ),
//           ],
//         ),
      
//     );}
// }