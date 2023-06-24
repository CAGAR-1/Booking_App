import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final String baseUrl;
  late Dio _dio;
  final Interceptor? interceptor;

  ApiClient({required this.baseUrl, required Dio dio, this.interceptor}) {
    _dio = dio;

    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 6000
      ..options.receiveTimeout = 6000
      ..httpClientAdapter
      ..options.headers = {'Accept': 'application/json'};

    if (interceptor != null) {
      _dio.interceptors.clear();
      _dio.interceptors.add(interceptor!);
    }
    _dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        requestBody: true));

    //handle certicicate verification check (For the http request)

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<dynamic> post(
    String uri, {
    // ignore: type_annotate_public_apis
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: {"requiresToken": false}),
      );
      print(response);
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final responce = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options ?? Options(headers: {"requiresToken": false}),
      );
      return responce.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
