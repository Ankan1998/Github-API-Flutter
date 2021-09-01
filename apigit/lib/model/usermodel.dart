import 'package:flutter/foundation.dart';

class UserModel {
  
  final String name;
  String bio;
  String avatarUrl;
  
  

  UserModel(
      {
      @required this.name,
      this.bio,
      this.avatarUrl,
});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        
        name: jsonData["login"],
        bio: jsonData["bio"],
        avatarUrl: jsonData["avatar_url"]);
  }
}
