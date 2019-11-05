import 'package:flutter/services.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

class NfcManager {
  static const platform = const MethodChannel('flutter.native/helper');

  /// Checks if phone has NFC reader
  /// [true]: yes
  /// [false]: yes but it is disabled
  /// [null]: doesn't have it
  static Future<bool> hasNfc() async {
    try {
      return await platform.invokeMethod<bool>('checkHasNfc');
    } on PlatformException catch (e, stack) {
      print(e);
      print(stack);

      return null;
    }
  }

  static Stream<NfcData> listenNfc() => FlutterNfcReader.onTagDiscovered();
}
