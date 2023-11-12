

// adress_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/address_viewmodel.dart';

class AddressWidget extends ConsumerWidget {
  final String address;

  const AddressWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(addressViewModelProvider);

    return InkWell(
      onTap: () => viewModel.openMap(address),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Theme.of(context).colorScheme.background, // 背景色
        child: Text(
          address,
          style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color), // テキスト色
        ),
      ),
    );
  }
}
