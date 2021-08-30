import 'package:apigit/screens/add_new_user.dart';
import 'package:apigit/widgets/user_list_with_listviewbuilder.dart';
import 'package:flutter/material.dart';

class GitApp extends StatelessWidget {
  
  static final String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Git App'),
          centerTitle: true,
        ),
        
        body: UserListWithListViewBuilder(),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            
            navigateToAddNewUserScreen(context);
          },
         
          child: Icon(Icons.add),
        ));
  }

  void navigateToAddNewUserScreen(BuildContext context) async {
 
    var result = await Navigator.pushNamed(context, AddNewUser.routeName);

    if (result == "success") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User added successfully !'),
        ),
      );
    }
  }
}
