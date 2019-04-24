import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';


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
  String _name, _description;
  Image _image;
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
              child: DateTimePickerFormField(
                inputType: inputType,
                format: formats[inputType],
                editable: editable,
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: DateTimePickerFormField(
                inputType: inputType,
                format: formats[inputType],
                editable: editable,
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
                onSaved: (input) => _description = input,
                decoration: new InputDecoration(
                  labelText: "Description",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                obscureText: true,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
