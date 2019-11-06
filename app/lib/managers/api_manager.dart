import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:scontreeno/models/api_response.dart';

class ApiManager {
  // ignore: non_constant_identifier_names
  static const String API_URL = r'https://demo3.fastersetup.it/api/';

  static Future<ApiResponse> getDio(
    String method, {
    Map<String, dynamic> data,
    Function(int, int) onSendProgress,
  }) async {
    try {
      dio.Dio dioClient = dio.Dio();
      // (dioClient.httpClientAdapter as dio.DefaultHttpClientAdapter)
      //     .onHttpClientCreate = (client) {
      //   client.badCertificateCallback =
      //       (X509Certificate cert, String host, int port) {
      //     return true;
      //   };
      // };

      final response = await dioClient.get(API_URL + method);

      if (response.statusCode == 200) {
        print('request was successfull');

        return ApiResponse(
          status: true,
          data: response.data,
          statusCode: response.data['status'],
        );
      } else {
        print('request failed');
        print(response.data);

        return ApiResponse(status: false);
      }
    } catch (ex, stack) {
      print(ex);
      print(stack);

      return ApiResponse(status: false);
    }
  }
}
