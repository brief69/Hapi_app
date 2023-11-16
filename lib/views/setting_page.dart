


// setting_page.dart
import 'package:ddz/providers/setting_viewmodel_provider.dart';
import 'package:ddz/views/address_page.dart';
import 'package:ddz/views/settingpages/rules_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    void showLogoutConfirmation() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  ref.read(settingsViewModelProvider).logout();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    void showDeleteAccountConfirmation() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Delete Account'),
            content: const Text('Are you sure you want to delete your account? This cannot be undone.'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  ref.read(settingsViewModelProvider).deleteAccount();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('SETTINGS', style: theme.appBarTheme.titleTextStyle),
      ),
      backgroundColor: theme.colorScheme.background,
      body: ListView(
        children: [
          _buildListTile(
            context: context,
            title: 'Bennu Rules',
            onTap: () => _navigateTo(context, const RulesPage()),
          ),
          _buildListTile(
            context: context,
            title: 'Address',
            onTap: () => _navigateTo(context, const AddressSetPage()),
          ),
          _buildListTile(
            context: context,
            title: 'Contacts',
            onTap: () async {
              const url = 'https://twitter.com/youraccount';
              if (!await launchUrl(Uri.parse(url))) {
                throw 'Could not launch $url';
              }
            },
          ),
          _buildListTile(
            context: context,
            title: 'Development',
            onTap: () async {
              const url = 'https://github.com/brief69/ddz';
              if (!await launchUrl(Uri.parse(url))) {
                throw 'Could not launch $url';
              }
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary),
            onPressed: showLogoutConfirmation,
            child: Text('Log Out', style: theme.textTheme.labelLarge),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary),
            onPressed: showDeleteAccountConfirmation,
            child: Text('Delete Account', style: theme.textTheme.labelLarge),
          ),
        ],
      ),
    );
  }
  Widget _buildListTile({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      onTap: onTap,
    );
  }
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
