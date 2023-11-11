

// post.dart
class PostItem {
  final String id;
  final String userIconUrl;
  final String username;
  final String fromAddress;
  final String toAddress;
  final double price;
  final DateTime dateTime;

  PostItem({
    required this.id,
    required this.userIconUrl,
    required this.username,
    required this.fromAddress,
    required this.toAddress,
    required this.price,
    required this.dateTime,
  });
}
