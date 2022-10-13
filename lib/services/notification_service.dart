import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationService {
  Future sendSpesificNotification(
      {required String uid, required String message}) async {
    OneSignal.shared.postNotification(
        OSCreateNotification(playerIds: [uid], content: message));
  }
}
