
// post_item_widget.dart
import 'package:ddz/models/post.dart';
import 'package:ddz/viewmodels/post_viewmodel.dart';
import 'package:ddz/widgets/post_actions_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostItemWidget extends ConsumerWidget {
  final PostItem postItem;

  const PostItemWidget({super.key, required this.postItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(postViewModelProvider.notifier);
    
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
                    showDialog(
                      context: context,
                      builder: (_) => PostActionsPopupMenu(
                        onEdit: () => viewModel.editPost(postItem),
                        onDelete: () => viewModel.deletePost(postItem),
                      ),
                    );
                  }
                )
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
