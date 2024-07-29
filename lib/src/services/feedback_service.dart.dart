import 'dart:io';
import 'dart:typed_data';

import 'package:feedback/feedback.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';

class FeedBackController {
  final List<String> recipients = ['hellalet.younes@gmail.com'];
  final List<String> cc = [''];
  final List<String> bcc = [''];

  void sendFeedBack(context) async {
    BetterFeedback.of(context).show((p0) async {
      final screenshotFilePath = await writeImageToStorage(p0.screenshot);

      final Email email = Email(
        body: p0.text,
        subject: 'Treck Tonic App FeedBack',
        recipients: recipients,
        attachmentPaths: [screenshotFilePath],
        isHTML: true,
        cc: cc,
        bcc: bcc,
      );

      await FlutterEmailSender.send(email);
    });
  }

  Future<String> writeImageToStorage(Uint8List feedBackScreenShot) async {
    final Directory output = await getTemporaryDirectory();
    final String screenShotPath = '${output.path}/feedback.png';
    final File file = File(screenShotPath);
    await file.writeAsBytes(feedBackScreenShot);
    return screenShotPath;
  }

  void getFeedBack() {
    // Get feedback from the server
  }
}
