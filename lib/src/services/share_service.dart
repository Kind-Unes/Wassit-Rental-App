import 'package:flutter/widgets.dart';
import 'package:wassit_cars_rental_app/src/injection_container.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  void share(
    String content,
    BuildContext context,
  ) async {
    final result = await Share.share(content);

    if (result.status == ShareResultStatus.success) {
      toast.success(context, "شكرا لك على مشاركة المحتوى");
    }
  }
}
