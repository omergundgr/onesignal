import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  Future initOneSignal() async {
    await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared.setAppId("29cb7bbc-7353-4a72-9f0c-e9bc765afa02");
    await OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true);
    await OneSignal.shared.consentGranted(true);
  }

  Future sendSpesificNotification(
      {required String uid,
      required String message,
      required BuildContext context}) async {
    if (!await OneSignal.shared.requiresUserPrivacyConsent()) {
      OneSignal.shared.postNotification(
          OSCreateNotification(playerIds: [uid], content: message));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Bildirim izni verilmedi"),
      ));
    }
  }
}
