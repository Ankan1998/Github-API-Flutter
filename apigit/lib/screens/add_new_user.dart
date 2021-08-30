import 'package:apigit/model/userlist_changenotifier.dart';
import 'package:apigit/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewUser extends StatefulWidget {
  static final String routeName = "/newuser";
  

  @override
  _AddNewUserState createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  String _txtName;


  UserModel _newuser;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildUserName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Login:'),
      validator: (String value) {
        if (value.isEmpty) {
          return "Login Required !";
        }
        return null;
      },
      onSaved: (String value) {
        _txtName = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New User'), 
        centerTitle: true,
        // backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                _buildUserName(),
                ElevatedButton(
                  onPressed: () {
                    if (!_formkey.currentState.validate()) {
                      return;
                    }

                    

                    _formkey.currentState.save();
                    _newuser = UserModel(
                        name: _txtName, 
                    );
                  
                    Provider.of<UserListChangeNotifier>(
                      context,
                      listen: false,
                    ).addNewUserToList(_newuser);

                    Navigator.of(context).pop("success");


                  },
                  child: Text('Add new User'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
