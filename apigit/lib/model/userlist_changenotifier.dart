import 'package:apigit/model/usermodel.dart';
import 'package:apigit/services/user_services.dart';
import 'package:flutter/material.dart';

class UserListChangeNotifier extends ChangeNotifier {
  List<UserModel> listofusers = [];
  final UserService _srvObject = UserService();

  void addNewUserToList(UserModel newUser) async {
    //listofusers.add(newuser); // service !
    var futureOfPostStatus = await _srvObject.fetchPostsByLogin(newUser.name);
    // ignore: unrelated_type_equality_checks
    print(futureOfPostStatus);
    listofusers.add(futureOfPostStatus);
    // print(listofusers);
    notifyListeners();
  }
}
