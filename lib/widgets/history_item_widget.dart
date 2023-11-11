

import 'package:flutter/material.dart';

class HistoryItemWidget extends StatelessWidget {
  final String title;
  final String content;

  const HistoryItemWidget({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(content, style: const TextStyle(color: Colors.white)),
      onTap: () {
        // 履歴アイテムタップ時の処理をここに書きます。
      },
    );
  }
}
