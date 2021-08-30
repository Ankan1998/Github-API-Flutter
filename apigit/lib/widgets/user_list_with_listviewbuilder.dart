import 'package:apigit/model/userlist_changenotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListWithListViewBuilder extends StatefulWidget {
  @override
  _UserListWithListViewBuilderState createState() =>
      _UserListWithListViewBuilderState();
}

class _UserListWithListViewBuilderState
    extends State<UserListWithListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserListChangeNotifier>(
      builder: (context, userlistCNInstance, child) => ListView.builder(
          itemCount: userlistCNInstance.listofusers.length,
          itemBuilder: (BuildContext context, int index) {
            //print(userlistCNInstance.listofusers[index].type);
            return Card(
              elevation: 10,
              child: ListTile(
                leading: Image(
                  width: 100.0,
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                      userlistCNInstance.listofusers[index].avatarUrl),
                ),
                title: Text(
                  userlistCNInstance.listofusers[index].name,
                  style: Theme.of(context).textTheme.headline1,
                ),
                subtitle: Text(
                  userlistCNInstance.listofusers[index].type,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            );
          }),
    );
  }
}
