import 'package:dio/dio.dart';

part './i_network_manager.dart';

class NetworkManager extends INetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    _instance ??= NetworkManager._();
    return _instance!;
  }

  NetworkManager._();

  @override
  addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }
}
