import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:scontreeno/models/api_response.dart';

class ApiManager {
  // ignore: non_constant_identifier_names
  static const String API_URL = r'https://demo3.fastersetup.it/api/';

  static Future<ApiResponse> getDio(
    String method, {
    Map<String, dynamic> data,
    Function(int, int) onSendProgress,
  }) async {
    print('get dio');

    try {
      print(method);

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

  static Future<ApiResponse> post(
    String method,
    dynamic data,
  ) async {
    print('post http');

    try {
      print('will start posting to $method -> $data');
      print(jsonEncode(data));

      final response = await http.post(
        API_URL + method,
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json"},
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        print('request was successfull');
        print(response.body);

        return ApiResponse(
          status: true,
          data: response.body,
        );
      } else {
        print('\n| server returned ${response.statusCode} |');
        print(response.body);

        return ApiResponse(status: false);
      }
    } catch (ex, stack) {
      print(ex);
      print(stack);

      return ApiResponse(status: false);
    }
  }
}
