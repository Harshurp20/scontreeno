package com.thunderstorm.scontreeno

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

import android.nfc.NfcAdapter
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodCall

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    
    MethodChannel(flutterView, "flutter.native/helper").setMethodCallHandler { call, result ->
      // Note: this method is invoked on the main thread.
      if (call.method == "checkHasNfc") {
        val nfcAdapter = NfcAdapter.getDefaultAdapter(this)
        if (nfcAdapter != null) {
          try {
            result.success(nfcAdapter.isEnabled)
          } catch (exp: Exception) {
            // Double try this as there are times it will fail first time
            try {
              result.success(nfcAdapter.isEnabled)
            } catch (exp: Exception) {
              result.success(false)
            }
          }
        } else {
          result.error("UNAVAILABLE", "NFC adapter not available.", null)
        }
      } else {
        result.notImplemented()
      }
    }
  }
}
