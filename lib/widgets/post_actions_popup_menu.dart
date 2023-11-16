

import 'package:flutter/material.dart';

class PostActionsPopupMenu extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PostActionsPopupMenu({
    Key? key,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_horiz),
      color: Colors.white,
      onPressed: () async {
        final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
        await showMenu(
          context: context,
          position: RelativeRect.fromRect(
            const Rect.fromLTRB(0, 0, 0, 0),
            Offset.zero & overlay.size,
          ),
          items: <PopupMenuEntry>[
            PopupMenuItem(
              value: 'edit',
              onTap: onEdit,
              child: const Text('Edit'),
            ),
            PopupMenuItem(
              value: 'delete',
              onTap: onDelete,
              child: const Text('Delete'),
            ),
            // 他のメニュー項目を追加
          ],
        );

        // 5秒後にメニューを自動的に閉じる
        await Future.delayed(const Duration(seconds: 5));
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      },
    );
  }
}
