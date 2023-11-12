

// fun_button_widget.dart
import 'package:flutter/material.dart';

import '../postswidgets/go_button_widget.dart';

class FunButtonWidget extends StatelessWidget {
  final Function fun;

  const FunButtonWidget({super.key, required this.fun});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white), // 右向きの矢印アイコン
      onPressed: () => _showFunModal(context),
    );
  }

  void _showFunModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FunWidget(fun: fun);
      },
    );
  }
}

class FunWidget extends StatelessWidget {
  final Function fun;

  const FunWidget({super.key, required this.fun});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background, // 背景色の指定
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // ここにFunWidgetのメインコンテンツを配置
            child: Center(
              child: Text('FunWidget Content Here'), // この部分をカスタマイズ
            ),
          ),
          GoButtonWidget(), // GoButtonWidgetの配置
        ],
      ),
    );
  }
}
