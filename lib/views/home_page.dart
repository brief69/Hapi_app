

// home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// MVVMのViewModelに相当する部分をRiverpodで実装します。
// ここでは具体的なビジネスロジックは省略し、投稿リストを管理するProviderを仮定します。
final postListProvider = Provider<List<PostItem>>((ref) {
  // ここにはFirestoreから投稿データを取得するロジックが入ります。
  // ダミーデータを返します。
  return [
    PostItem(title: 'Post 1', content: 'Content for post 1'),
    PostItem(title: 'Post 2', content: 'Content for post 2'),
    PostItem(title: 'Post 3', content: 'Content for post 3'),
  ];
});

// 単一の投稿を表すモデルクラス
class PostItem {
  final String title;
  final String content;

  PostItem({required this.title, required this.content});
}

// home_page.dart
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 投稿リストをProviderから取得します。
    final postList = ref.watch(postListProvider);

    return Scaffold(
      // AppBarの代わりにSliverAppBarを使います。
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            // AppBarの右側に検索フォームと通知アイコンを配置
            actions: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    fillColor: Colors.white.withAlpha(235),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // 通知アイコンの処理をここに書きます。
                },
              ),
            ],
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'Home'),
                  Tab(icon: Icon(Icons.search), text: 'Search'),
                  Tab(icon: Icon(Icons.person), text: 'Profile'),
                ],
              ),
            ),
            pinned: true,
          ),
          // 投稿リストを表示するSliverList
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final post = postList[index];
                return ListTile(
                  title: Text(post.title, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(post.content, style: const TextStyle(color: Colors.white)),
                );
              },
              childCount: postList.length,
            ),
          ),
        ],
      ),
    );
  }
}

// SliverPersistentHeaderのためのDelegateクラス
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).primaryColor, // テーマのプライマリカラーを使用
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
