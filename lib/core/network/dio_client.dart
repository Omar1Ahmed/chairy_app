// core/network/dio_client.dart


import 'package:chairy_app/core/Localization/Locales/generated/l10n.dart';
import 'package:chairy_app/core/network/ApiCalls.dart';
import 'package:chairy_app/core/network/Connectivity/connectivity_helper.dart';
import 'package:dio/dio.dart';


class DioClient implements ApiCalls {
  late final Dio dio;

  DioClient(this.dio);

  @override
  Future<Map<String, dynamic>> get(String url, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? header}) async {
    final isConnected = await ConnectivityHelper.isConnected();
    if (isConnected) {
      try {
        final response = await dio.get(
          url,
          queryParameters: queryParameters,
          options: Options(
            headers: header,
          ),
        );

        return _validateResponseData(response);
      } on DioException catch (e) {
        throw DioExeptionHandler.handleError(e);
      }
    }else{
      throw NoInternetConnectionException(message: S.current.noInternetConnection);
    }
  }

  @override
  Future<Map<String, dynamic>> post(String url, {Map<String, dynamic>? body, Map<String, dynamic>? header}) async {
    final isConnected = await ConnectivityHelper.isConnected();
    if (isConnected) {
      try {
        final response = await dio.post(
          url,
          data: body,
          options: Options(headers: header),
        );

        return _validateResponseData(response);
      } on DioException catch (e) {
        throw DioExeptionHandler.handleError(e);
      }
    } else {
      throw NoInternetConnectionException(message: S.current.noInternetConnection);    }
  }

  @override
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic>? body, {Map<String, dynamic>? header}) async {
    final isConnected = await ConnectivityHelper.isConnected();
    if (isConnected) {
      try {
        final response = await dio.put(
          url,
          data: body,
          options: Options(
            headers: header,
          ),
        );

        return _validateResponseData(response);
      } on DioException catch (e) {
        throw DioExeptionHandler.handleError(e);
      }
    } else {
      throw NoInternetConnectionException(message: S.current.noInternetConnection);    }
  }

  @override
  Future<Map<String, dynamic>> delete(String url, {Map<String, dynamic>? header}) async {
    final isConnected = await ConnectivityHelper.isConnected();
    if (isConnected) {
      try {
        final response = await dio.request(
          url,
          options: Options(
            headers: header,
            method: 'DELETE',
          ),
        );

        return _validateResponseData(response);
      } on DioException catch (e) {
        throw DioExeptionHandler.handleError(e);
      }
    } else {
      throw NoInternetConnectionException(message: S.current.noInternetConnection);
    }
  }

  Map<String, dynamic> _validateResponseData(Response response) {
    // Check if the response status is successful
    if (response.statusCode == 204 || response.statusCode == 201 || response.statusCode == 200) {
      if (response.data == null || response.data.toString().isEmpty) {
        return {
          'statusCode': response.statusCode,
          'message': 'No content available'
        };
      }
    }

    // Handle if the response data is a Map or a List
    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else if (response.data is List) {
      return {
        'data': response.data
      };
    } else if (response.data != null) {
      return {
        'data': response.data
      };
    } else {
      throw Exception('Invalid response format: Expected Map<String, dynamic> or List, but got ${response.runtimeType}');
    }
  }


}

class DioExeptionHandler {
  static String handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return S.current.connectionTimeout;
      case DioExceptionType.sendTimeout:
        return S.current.sendTimeout;
      case DioExceptionType.connectionError:
        return S.current.connectionError;
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response?.statusCode);
      default:
        return S.current.unexpectedError;
    }
  }

  static String _handleBadResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return S.current.badRequest;
      case 401:
        return S.current.unauthorized;
      case 404:
        return S.current.notFound;
      case 500:
        return S.current.serverError;
      default:
        return S.current.unexpectedError;
    }
  }
}
