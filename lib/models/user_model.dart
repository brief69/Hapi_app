

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  final String email;
  // 他に必要な属性があれば追加

  UserModel({required this.id, required this.email});

  // FirebaseのUserオブジェクトからUserModelを生成するファクトリメソッド
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
    );
  }

  // JSONからUserModelを生成するファクトリメソッド
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
    );
  }

  // UserModelをJSONに変換するメソッド
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}
