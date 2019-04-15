import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Auction'),
          actions: <Widget>[
            // ADD Icon Display
            new IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white
              ),
              // FUNCTION to MAKE A NEW BID
              onPressed: (){},
            ),
            // SEARCH Icon Display
            new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white
              ),
              // Function to Implement SEARCH
              onPressed: (){},
            )
          ],
        ),
      )
    );
  }
}