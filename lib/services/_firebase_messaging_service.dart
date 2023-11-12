

import 'package:firebase_messaging/firebase_messaging.dart';

class YourFirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // 未読通知のカウントを提供するメソッド
  Stream<int> getUnreadNotificationsCount() {
    // 未読通知をカウントするロジックを実装
    // ここでは仮の実装として、常に0を返す
    return Stream.value(0);
  }

  // Firebaseからの通知を受信するための初期設定
  void initialize() {
    // FCMの初期設定や通知受信時のハンドラーを設定
    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // その他、必要に応じて通知関連のメソッドを追加
}
