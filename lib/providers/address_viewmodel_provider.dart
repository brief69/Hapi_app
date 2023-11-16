

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final addressViewModelProvider = StateNotifierProvider<AddressViewModel, List<String>>((ref) {
  return AddressViewModel();
});

class AddressViewModel extends StateNotifier<List<String>> {
  AddressViewModel() : super([]);

  // Firestoreから住所を読み込む
  Future<void> loadAddresses() async {
  try {
    var collection = FirebaseFirestore.instance.collection('addresses');
    var snapshot = await collection.doc('user_id').get(); // 'user_id'は適切なユーザーIDに置き換える
    if (snapshot.exists && snapshot.data() != null) {
      var data = snapshot.data() as Map<String, dynamic>;
      state = List<String>.from(data['addresses'] ?? []);
    }
  } catch (e) {
    // エラーハンドリング
  }
  }

  // 住所を追加する
  void addAddress(String address) async {
  if (state.length < 3) {
    var newState = [...state, address];
    state = newState;
    try {
      var collection = FirebaseFirestore.instance.collection('addresses');
      await collection.doc('user_id').set({'addresses': newState});
    } catch (e) {
      // エラーハンドリング
    }
  }
}

  // 住所を削除する
  void removeAddress(String address) async {
  var newState = state.where((addr) => addr != address).toList();
  state = newState;
  try {
    var collection = FirebaseFirestore.instance.collection('addresses');
    await collection.doc('user_id').update({'addresses': newState});
  } catch (e) {
    // エラーハンドリング
  }
}
}