

import 'package:ddz/models/post.dart';
import 'package:flutter/material.dart';

class PostItemWidget extends StatelessWidget {
  final PostItem postItem;

  const PostItemWidget({super.key, required this.postItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // タップ時の画面遷移のロジックをここに追加します。
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(postItem.userIconUrl),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postItem.username,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        postItem.fromAddress,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        postItem.toAddress,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        '\$${postItem.price.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.white,
                  onPressed: () {
                    // More icon の処理をここに追加します。
                    // cuptino widgetのアレを挿す
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${postItem.dateTime}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
