
import 'wflutter_kit_platform_interface.dart';

class WflutterKit {
  Future<String?> getPlatformVersion() {
    return WflutterKitPlatform.instance.getPlatformVersion();
  }
}
