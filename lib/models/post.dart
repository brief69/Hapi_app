

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userIconUrl': userIconUrl,
      'username': username,
      'fromAddress': fromAddress,
      'toAddress': toAddress,
      'price': price,
      'dateTime': dateTime,
    };
  }

  // JSONからPostItemオブジェクトを作成するファクトリコンストラクタもここに追加することができます。
}

