import 'package:scontreeno/managers/api_manager.dart';
import 'package:scontreeno/models/transaction_article.dart';

class ReceiptsManager {
  static Future getReceipts() async {
    final response = await ApiManager.getDio('User/history');
    print(response.data);
  }

  static Future getStatistics() async {
    final response = await ApiManager.getDio('User/stats');
    print(response.data);
  }

  static Future getStatus() async {
    final response = await ApiManager.getDio('User/status');
    print(response.data);
  }

  static Future<bool> validateToken(String token) async {
    final response = await ApiManager.getDio(
      'Receipt/validate?transactionId=${token.trim()}',
    );
    print(response.data);
    print(response.status);

    return response.status;
  }

  static Future addReceipt(List<TransactionArticle> articles) async {
    final response = await ApiManager.getDio('User/status');
  }
}
