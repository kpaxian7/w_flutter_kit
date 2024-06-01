import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wflutter_kit_method_channel.dart';

abstract class WflutterKitPlatform extends PlatformInterface {
  /// Constructs a WflutterKitPlatform.
  WflutterKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static WflutterKitPlatform _instance = MethodChannelWflutterKit();

  /// The default instance of [WflutterKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelWflutterKit].
  static WflutterKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WflutterKitPlatform] when
  /// they register themselves.
  static set instance(WflutterKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
