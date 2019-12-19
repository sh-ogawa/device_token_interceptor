import Flutter

public class SwiftDeviceTokenInterceptorPlugin: NSObject, FlutterPlugin {
    private static var channel: FlutterMethodChannel!
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        channel = FlutterMethodChannel(name: "ooga04/device_token_interceptor", binaryMessenger: registrar.messenger())
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("this plugin call only ios -> flutter.")
    }
    
    @objc static public func onToken(deviceToken: Data) {
        let token = deviceToken.map { String(format: "%.2hhx", $0) }.joined()
        channel.invokeMethod("onToken", arguments: token)
        return
    }
    
}
