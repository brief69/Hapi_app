

// rules_page.dart
import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hapi Rules', style: theme.textTheme.titleLarge),
        backgroundColor: theme.appBarTheme.backgroundColor,
          bottom: const TabBar(
            tabs: [
            Tab(text: 'Hapi User Rules'),
              Tab(text: 'Hapi Management Rules'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserRulesTab(),
            ManagementRulesTab(),
          ],
        ),
      ),
    );
  }
}

class UserRulesTab extends StatelessWidget {
  const UserRulesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('地点aから地点bまでの移動以外のことを求めてはならない。'),
        ),
        ListTile(
          title: Text(''),
        ),
        ListTile(
          title: Text('Hapiは、完全に民主的な移動実現アプリです。'),
        ),
        ListTile(
          title: Text(''),
        ),
        ListTile(
          title: Text('取引トラブルが起これば、コメントに書く、書かれる'),
        ),
        ListTile(
          title: Text(''),
        ),
        ListTile(
          title: Text('積極的にRelayしてください。それがあなたの利益です。'),
        ),
        ListTile(
          title: Text(''),
        ),
        ListTile(
          title: Text(''),
        ),
        ListTile(
          title: Text('')
        ),
      ],
    );
  }
}

class ManagementRulesTab extends StatelessWidget {
  const ManagementRulesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('運営ルール1'),
        ),
        ListTile(
          title: Text('運営ルール2'),
        ),
        ListTile(
          title: Text('運営ルール3'),
        ),
        ListTile(
          title: Text('運営ルール4'),
        ),
        ListTile(
          title: Text('運営ルール5'),
        ),
        ListTile(
          title: Text('運営ルール6'),
        ),
        ListTile(
          title: Text('運営ルール7'),
        ),
        ListTile(
          title: Text('運営ルール8'),
        ),
        ListTile(
          title: Text('運営ルール9'),
        ),
      ],
    );
  }
}