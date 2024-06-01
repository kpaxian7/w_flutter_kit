import 'package:flutter_test/flutter_test.dart';
import 'package:wflutter_kit/wflutter_kit.dart';
import 'package:wflutter_kit/wflutter_kit_platform_interface.dart';
import 'package:wflutter_kit/wflutter_kit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWflutterKitPlatform
    with MockPlatformInterfaceMixin
    implements WflutterKitPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WflutterKitPlatform initialPlatform = WflutterKitPlatform.instance;

  test('$MethodChannelWflutterKit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWflutterKit>());
  });

  test('getPlatformVersion', () async {
    WflutterKit wflutterKitPlugin = WflutterKit();
    MockWflutterKitPlatform fakePlatform = MockWflutterKitPlatform();
    WflutterKitPlatform.instance = fakePlatform;

    expect(await wflutterKitPlugin.getPlatformVersion(), '42');
  });
}
