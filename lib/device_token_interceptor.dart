import 'dart:async';

import 'package:flutter/services.dart';

class DeviceTokenInterceptor {
  static const MethodChannel _channel =
      const MethodChannel('ooga04/device_token_interceptor');

  final StreamController<String> _tokenStreamController = StreamController<String>.broadcast();

  DeviceTokenInterceptor() {
    _channel.setMethodCallHandler(_handleMethod);
  }

  Stream<String> get onTokenRefresh {
    return _tokenStreamController.stream;
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "onToken":
        final String token = call.arguments;
        _tokenStreamController.add(token);
        return null;
      default:
        throw UnsupportedError("Unrecognized JSON message");
    }
  }
}
