

// passkey_service.dart
import 'package:passkeys/passkey_auth.dart';
import '../models/user_model.dart';

class PasskeyService {
  final PasskeyAuth _passkeyAuth = PasskeyAuth(RelyingPartyServer());

  // パスキーによる新規登録
  Future<UserModel?> signUpWithPasskey(String email) async {
    return null;
  
    // PasskeyAuthを使用して新規登録のリクエストを送信
    // 適切なレスポンスを受け取り、UserModelに変換するロジックを実装
  }

  // パスキーによるログイン
  Future<UserModel?> signInWithPasskey(String email) async {
    return null;
  
    // PasskeyAuthを使用してログインのリクエストを送信
    // 適切なレスポンスを受け取り、UserModelに変換するロジックを実装
  }

  // パスキーの登録や認証の詳細なロジックは、
  // プロジェクトの要件とPasskeysパッケージのドキュメントに基づいて実装する。
}
