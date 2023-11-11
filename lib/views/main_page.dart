

// main_page.dart
import 'package:ddz/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'post_page.dart';
import 'profile_page.dart';

// 現在選択されているタブのインデックスを管理するProvider
final tabProvider = StateProvider((ref) => 0);


// MainPage Widget
class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 現在のタブインデックスをリッスンします。
    // ignore: deprecated_member_use
    final tabIndex = ref.watch(tabProvider.state).state;

    return Scaffold(
      body: IndexedStack(
        index: tabIndex,
        children: [
          const HomePage(),
          (),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) => ref.read(tabProvider.state).state = index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
