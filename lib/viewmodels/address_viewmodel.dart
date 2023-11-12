

// address_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AddressViewModel {
  Future<void> openMap(String address) async {
    // デフォルト地図アプリでの経路検索URLを生成
    var url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$address');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

final addressViewModelProvider = Provider((ref) => AddressViewModel());
