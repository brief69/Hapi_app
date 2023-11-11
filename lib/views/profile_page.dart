

import 'package:ddz/widgets/history_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 仮のユーザーデータ
    const String userIconUrl = 'https://via.placeholder.com/150';
    const String username = 'John Doe';
    const int followers = 120;
    const int following = 75;
    const double rating = 4.5; // 星評価

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // 設定アイコンの処理をここに書きます。
            },
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColor, // テーマ色を背景に使用
        child: ListView(
          children: [
            // ユーザー情報セクション
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(userIconUrl),
                    radius: 40,
                  ),
                  const SizedBox(height: 8),
                  const Text(username, style: TextStyle(color: Colors.white, fontSize: 24)),
                  const SizedBox(height: 8),
                  IconTheme(
                    data: const IconThemeData(color: Colors.amber, size: 20),
                    child: StarDisplay(value: (rating * 5).round()), // 星評価ウィジェット
                  ),
                  const SizedBox(height: 8),
                  const Text('Followers: $followers', style: TextStyle(color: Colors.white)),
                  const Text('Following: $following', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            // 履歴セクション
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'History',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            ...List.generate(10, (index) {
              // 履歴アイテムの仮のデータ
              return HistoryItemWidget(
                title: 'History $index',
                content: 'This is a detail of history item $index',
              );
            }),
          ],
        ),
      ),
    );
  }
}

// 星評価を表示するためのウィジェット
class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key? key, this.value = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
