import 'package:common_dependency_module/common_dependency_module.dart';

class DioClient {
  static const String _apiKey = 'API_KEY';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  final Dio _dio;

  DioClient() : _dio = Dio() {
    _dio.options.baseUrl = _baseUrl;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters.addAll({
            'api_key': _apiKey,
            'language': 'es-ES',
          });
          return handler.next(options);
        },
      ),
    );
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Fallo la petición Dio: ${e.message}');
    } catch (e) {
      rethrow;
    }
  }
}
