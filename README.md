# device_token_interceptor

Used with firebase_messaging.
Since firebase_messaging cannot get apns device token, it is a plug-in for interrupting and acquiring.

# Usage

## Dart code

```dart

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_token_interceptor/device_token_interceptor.dart';

  var _connector = FirebaseMessaging();

  var _tokenInterceptor = DeviceTokenInterceptor();
  var stream = _tokenInterceptor.onTokenRefresh;
  _connector.requestNotificationPermissions();

  _connector.configure(
    onMessage: _onMessage,
    onBackgroundMessage: null,
    onLaunch: _onLaunch,
    onResume: _onResume,
  );

  var deviceToken = await stream.first;

```

## Your AppDelegate.swift

```swift

import device_token_interceptor

override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    SwiftDeviceTokenInterceptorPlugin.onToken(deviceToken: deviceToken)
}


```