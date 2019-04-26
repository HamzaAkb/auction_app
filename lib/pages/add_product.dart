import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auction_app/pages/home.dart';
import 'package:auction_app/pages/drawer.dart';

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
        child: new Drawerr(user: user),
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
  String _name, _description, _category;
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
  File _image;
  String _filename;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      _filename = image.path;
    });
  }

  Future<String> uploadImage() async {
    StorageReference ref = FirebaseStorage.instance.ref().child(_filename);
    StorageUploadTask uploadTask = ref.putFile(_image);

    var downURL = await (await uploadTask.onComplete).ref.getDownloadURL();
    var url = downURL.toString();

    return "";
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

    final ref = FirebaseStorage.instance.ref().child(_image.path);

    String url = await ref.getDownloadURL();

    Firestore.instance.collection('bid').add({
      'userID': user.uid,
      'description': _description,
      'name': _name,
      'category': _category,
      'starting_date': _starting_date,
      'ending_date': _ending_date,
      'image': url
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new Home(
                  user: user,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please Enter Name of Product';
                  }
                },
                onSaved: (input) {
                  _name = input;
                },
                decoration: new InputDecoration(
                  labelText: "Name",
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
              child: new DropdownButton<String>(
                hint: Text('Choose Category'),
                items: <String>['Sports', 'Electronics', 'Clothes']
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
              child: DateTimePickerFormField(
                inputType: inputType,
                format: formats[inputType],
                editable: editable,
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: DateTimePickerFormField(
                inputType: inputType,
                format: formats[inputType],
                editable: editable,
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
                onSaved: (input) {
                  _description = input;
                },
                decoration: new InputDecoration(
                  labelText: "Description",
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
            RaisedButton(
              child: new Text('UPLOAD'),
              onPressed: uploadImage,
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
          ],
        ),
      ),
    );
  }

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
}
