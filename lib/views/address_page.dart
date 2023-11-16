

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ddz/providers/address_viewmodel_provider.dart';

class AddressSetPage extends ConsumerWidget {
  const AddressSetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final addresses = ref.watch(addressViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Your Address', style: theme.appBarTheme.titleTextStyle),
      ),
      body: Column(
        children: [
          // 住所をリスト表示
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(addresses[index], style: theme.textTheme.bodyLarge),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => ref.read(addressViewModelProvider.notifier).removeAddress(addresses[index]),
                  ),
                );
              },
            ),
          ),
          // 住所追加用のフォーム
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildAddressForm(context, ref),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressForm(BuildContext context, WidgetRef ref) {
    final TextEditingController addressController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: addressController,
          decoration: const InputDecoration(
            labelText: 'New Address',
            border: OutlineInputBorder(),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: const Text('Add Address'),
          onPressed: () {
            if (addressController.text.isNotEmpty) {
              ref.read(addressViewModelProvider.notifier).addAddress(addressController.text);
              addressController.clear();
            }
          },
        ),
      ],
    );
  }
}
