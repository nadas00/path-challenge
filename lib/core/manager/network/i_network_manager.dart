part of './network_manager.dart';

abstract class INetworkManager {
  late Dio _dio;
  Dio get dio => _dio;
  INetworkManager();
  void init(String baseUrl, Map<String, dynamic>? headers) {
    _dio = Dio(
      BaseOptions(baseUrl: baseUrl, headers: headers),
    );
  }

  addInterceptor(Interceptor interceptor);
}
