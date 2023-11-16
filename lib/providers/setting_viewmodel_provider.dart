

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final settingsViewModelProvider = Provider<SettingsViewModel>((ref) {
  return SettingsViewModel();
});

class SettingsViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> deleteAccount() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await user.delete();
      // 必要に応じて、ユーザーに関連する他のデータも削除
    }
  }
}
