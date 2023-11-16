

import 'package:ddz/models/route_model.dart';
import 'package:ddz/viewmodels/route_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// RoutePainter
class RoutePainter extends CustomPainter {
  final RouteModel model;

  RoutePainter(this.model);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4;

    double spacing = size.width / (model.numberOfNodes - 1);
    double radius = 10;
    // ignore: avoid_init_to_null
    Offset? lastNode = null; // Nullable型にしてnullで初期化

    for (int i = 0; i < model.numberOfNodes; i++) {
      var node = Offset(spacing * i, size.height / 2);
      if (i > 0 && lastNode != null) {
        // Draw edge
        canvas.drawLine(lastNode, node, paint);
      }
      // Draw node
      canvas.drawCircle(node, radius, paint);
      lastNode = node;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // ここでは常に再描画
  }
}


// RouteWidget
class RouteWidget extends ConsumerWidget {
  const RouteWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeModel = ref.watch(routeViewModelProvider);

    return GestureDetector(
      onTap: () {
        // ポップアップ表示ロジックをここに追加
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Route Information"),
              content: Text("Nodes: ${routeModel.numberOfNodes}\nEdges: ${routeModel.edgesLengths.join(', ')}"),
            );
          },
        );
      },
      child: CustomPaint(
        painter: RoutePainter(routeModel),
        size: const Size(200, 50), // AppBarに適したサイズに調整
      ),
    );
  }
}
