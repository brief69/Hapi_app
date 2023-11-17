

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthenticationViewModel with ChangeNotifier {
  final AuthenticationService _authService = AuthenticationService();

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  bool get isAuthenticated => _currentUser != null;

  // 新規登録メソッド
  Future<bool> signUp({required String email, required String password}) async {
    try {
      UserModel user = await _authService.signUpWithEmail(email, password);
      _currentUser = user;
      notifyListeners();
      return true;
    } catch (e) {
      // エラーハンドリング
      return false;
    }
  }

  // ログインメソッド
  Future<bool> signIn({required String email, required String password}) async {
    try {
      UserModel user = await _authService.signInWithEmail(email, password);
      _currentUser = user;
      notifyListeners();
      return true;
    } catch (e) {
      // エラーハンドリング
      return false;
    }
  }

  // ログアウトメソッド
  Future<void> signOut() async {
    await _authService.signOut();
    _currentUser = null;
    notifyListeners();
  }
}
class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // 新規登録メソッド
  Future<UserModel> signUpWithEmail(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return UserModel.fromFirebaseUser(userCredential.user!);
  }

  // ログインメソッド
  Future<UserModel> signInWithEmail(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return UserModel.fromFirebaseUser(userCredential.user!);
  }

  // ログアウトメソッド
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

