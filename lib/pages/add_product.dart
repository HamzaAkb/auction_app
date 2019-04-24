<<<<<<< HEAD
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
=======
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

<<<<<<< HEAD
import 'package:auction_app/pages/home.dart';
=======
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de

class AddProduct extends StatelessWidget {
  const AddProduct({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: new Center(
          child: new Text('Add Product'),
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
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
                color: Colors.black,
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
        child: AddProductForm(),
      ),
    );
  }
}

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
<<<<<<< HEAD
  String _name, _description, _category;
=======
  String _name, _description;
  Image _image;
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  // Changeable in demo
  InputType inputType = InputType.both;
  bool editable = true;
  DateTime _ending_date;
  DateTime _starting_date;
<<<<<<< HEAD
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future<FirebaseAuth> addProd() async {
    final formState = _formKey.currentState;

    formState.save();

    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    // Firestore.instance.collection('bid').document(user.uid).setData({
    //   'description': _description,
    //   'ending_date': _ending_date,
    //   'image': _image,
    //   'name': _name,
    //   'starting_date': _starting_date,
    //   'userID' : user.uid
    // });

    // var carData = {
    //   'description': _description,
    //   'ending_date': _ending_date,
    //   'image': _image,
    //   'name': _name,
    //   'starting_date': _starting_date
    // };

    Firestore.instance.collection('bid').add({
      'userID': user.uid,
      'description': _description,
      'name': _name,
      'category' : _category,
      'starting_date': _starting_date,
      'ending_date': _ending_date,
      //'image': _image
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new Home(
                  user: user,
                )));
  }
=======
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please Enter Product Name';
                  }
                },
                onSaved: (input) => _name = input,
                decoration: new InputDecoration(
                  labelText: "Product Name",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
<<<<<<< HEAD
              child: new DropdownButton<String>(
                hint: Text('Choose Category'),
                items: <String>['Sports', 'Electronis', 'Clothes']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  _category = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
=======
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de
              child: DateTimePickerFormField(
                inputType: inputType,
                format: formats[inputType],
                editable: editable,
<<<<<<< HEAD
                onChanged: (dt) => _starting_date = dt,
                decoration: new InputDecoration(
                  labelText: 'Starting Date/Time',
                  hasFloatingPlaceholder: false,
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
=======
                onChanged: (dt) => setState(() => _starting_date = dt),
                decoration: new InputDecoration(
                  labelText: 'Date/Time', hasFloatingPlaceholder: false,
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: DateTimePickerFormField(
                inputType: inputType,
                format: formats[inputType],
                editable: editable,
<<<<<<< HEAD
                onChanged: (dt) => _ending_date = dt,
                decoration: new InputDecoration(
                  labelText: 'Ending Date/Time', hasFloatingPlaceholder: false,
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
=======
                onChanged: (dt) => setState(() => _ending_date = dt),
                decoration: new InputDecoration(
                  labelText: 'Date/Time', hasFloatingPlaceholder: false,
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please Enter Description of Product';
                  }
                },
<<<<<<< HEAD
                onSaved: (input) {
                  _description = input;
                },
=======
                onSaved: (input) => _description = input,
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de
                decoration: new InputDecoration(
                  labelText: "Description",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
<<<<<<< HEAD
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Center(
                child: _image == null
                    ? Text('No image selected.')
                    : Image.file(_image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: new FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: new ButtonTheme(
                minWidth: double.infinity,
                buttonColor: Colors.black,
                height: 50,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0)),
                  child: new Text(
                    'Add Product',
                    style: new TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    addProd();
                  },
                ),
              ),
            ),
=======
                obscureText: true,
              ),
            ),
            
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD

  void _showDialog(_description) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Try Again"),
          content: new Text("${_description}"),
        );
      },
    );
  }
=======
>>>>>>> d6dc8d2f20c3423cba6b22a03f7783019a62f1de
}
