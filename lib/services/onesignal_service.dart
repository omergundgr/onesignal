import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  Future initOneSignal() async {
    await OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
    await OneSignal.shared.setAppId("29cb7bbc-7353-4a72-9f0c-e9bc765afa02");
    await OneSignal.shared.promptUserForPushNotificationPermission();
  }
}
