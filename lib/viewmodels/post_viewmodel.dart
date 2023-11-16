

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ddz/models/post.dart';

final postViewModelProvider = StateNotifierProvider<PostViewModel, List<PostItem>>(
  (ref) => PostViewModel(),
);

class PostViewModel extends StateNotifier<List<PostItem>> {
  PostViewModel() : super([]);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> editPost(PostItem postItem) async {
    try {
      // Firestoreのドキュメントを更新
      await _firestore.collection('posts').doc(postItem.id).update(postItem.toJson());
      // ローカルの状態も更新
      state = [
        for (final item in state)
          if (item.id == postItem.id) postItem else item,
      ];
    } catch (e) {
      // エラーハンドリング
    }
  }

  Future<void> deletePost(PostItem postItem) async {
    try {
      // Firestoreのドキュメントを削除
      await _firestore.collection('posts').doc(postItem.id).delete();
      // ローカルの状態も更新
      state = state.where((item) => item.id != postItem.id).toList();
    } catch (e) {
      // エラーハンドリング
    }
  }
}
