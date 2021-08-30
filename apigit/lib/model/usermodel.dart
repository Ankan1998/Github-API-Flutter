import 'package:flutter/foundation.dart';

class UserModel {
  
  final String name;
  String type;
  String avatarUrl;
  
  

  UserModel(
      {
      @required this.name,
      this.type,
      this.avatarUrl,
});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        
        name: jsonData["login"],
        type: jsonData["type"],
        avatarUrl: jsonData["avatar_url"]);
  }
}
