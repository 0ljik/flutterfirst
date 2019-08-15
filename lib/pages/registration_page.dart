import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
// Define a custom Form widget.
  @override
  RegistrationPageState createState() {
  return RegistrationPageState();
  }
  }

// Define a corresponding State class.
// This class holds data related to the form.
  class RegistrationPageState extends State<RegistrationPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
    final _formKey = GlobalKey<FormState>();
    // Initially password is obscure
    bool _obscureText = true;
    final username = TextEditingController();
    final pass = TextEditingController();
    //final region = TextEditingController();
    final name = TextEditingController();
    final surname = TextEditingController();
    final phone = TextEditingController();
    //final photo = TextEditingController();

    // Toggles the password show status
    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

var _value = "1";

  DropdownButton _normalDown() => DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            value: "1",
            child: Text(
              "Karagandy",
            ),
          ),
          DropdownMenuItem<String>(
            value: "2",
            child: Text(
              "Almaty",
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
        value: _value,
      );

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      username.dispose();
      pass.dispose();
      name.dispose();
      surname.dispose();
      phone.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      // Build a Form widget using the _formKey created above.
      return new Scaffold(
        appBar: new AppBar(title: new Text("Registration")),
        body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new TextFormField(
              decoration: const InputDecoration(
                //icon: Icon(Icons.person),
                hintText: 'Enter username',
                labelText: 'Username *',
              ),
              controller: username,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
            ),
          new TextFormField(
          decoration: const InputDecoration(
              labelText: 'Password',
              icon: const Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  //child: const Icon(Icons.lock)
              )),
          validator: (val) => val.length < 6 ? 'Password too short.' : null,
          //onSaved: (val) => _password = val,
          obscureText: _obscureText,
        ),
          new FlatButton(
            onPressed: _toggle,
            child: new Text(_obscureText ? "Show" : "Hide")),
        
new TextFormField(
              decoration: const InputDecoration(
                //icon: Icon(Icons.person),
                hintText: 'Enter name',
                labelText: 'Name *',
              ),
              controller: name,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
            ),
new TextFormField(
              decoration: const InputDecoration(
                //icon: Icon(Icons.person),
                hintText: 'Enter surname',
                labelText: 'Surname *',
              ),
              controller: surname,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
            ),
new TextFormField(
              decoration: const InputDecoration(
                //icon: Icon(Icons.person),
                hintText: 'Enter phone',
                labelText: 'Phone *',
              ),
              controller: phone,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
            ),
            SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //our code.
            Container(
              child: _normalDown(),
            ),
            SizedBox(height: 10),
            
          ],
        ),
      ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                        //save data
                  }
                },
                child: Text('Register'),
              ),
            ),
          ],
        ),
          ),
      );
    }
  }