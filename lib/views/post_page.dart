

// post_page.dart
import 'package:ddz/providers/address_viewmodel_provider.dart';
import 'package:ddz/widgets/postswidgets/go_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController senderAddressController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    void _showAddressModal() async {
      final addresses = ref.read(addressViewModelProvider);
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: addresses.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(addresses[index]),
                onTap: () {
                  senderAddressController.text = addresses[index];
                  Navigator.pop(context);
                }
              );
            }
          );
        }
      );
    }
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
              controller: senderAddressController,
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
              onTap: _showAddressModal,
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
      floatingActionButton: const GoButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
