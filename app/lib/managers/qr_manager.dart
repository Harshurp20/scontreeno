import 'package:flutter/material.dart';
import 'package:scontreeno/pages_app/transactions_list/qr_scan_page.dart';

class QrManager {
  static Future<String> scanToken(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => QrScanPage()),
    );

    return result;
  }
}
