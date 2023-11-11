

// post_page.dart
import 'package:ddz/widgets/go_button_widget.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Go'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 送り主の住所とユーザーネーム
            TextField(
              decoration: InputDecoration(
                labelText: 'Sender Address',
                labelStyle: const TextStyle(color: Colors.white),
                hintText: 'Enter sender address',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            // 受取人の住所とユーザーネーム
            TextField(
              decoration: InputDecoration(
                labelText: 'Recipient Address',
                labelStyle: const TextStyle(color: Colors.white),
                hintText: 'Enter recipient address',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            // 価格入力フィールドと矢印ボタン
            Row(
              children: [
                // 上矢印ボタン（太め）
                IconButton(
                  icon: const Icon(Icons.arrow_upward, size: 30),
                  color: Colors.white,
                  onPressed: () {
                    // 矢印ボタンの処理をここに書きます。
                  },
                ),
                Expanded(
                  // 価格入力フィールド
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Price',
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Enter price',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: const GoButtonWidget(), // Goボタンウィジェットを配置
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
