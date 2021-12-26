import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_challenge/core/manager/network/network_manager.dart';
import 'package:path_challenge/product/manager/network/dio_api_key_interceptor.dart';

void main() {
  late INetworkManager networkManager;
  const String baseUrl = "https://jsonplaceholder.typicode.com";
  setUp(() {
    networkManager = NetworkManager.instance..init(baseUrl, {});
  });
  group('Network Manager Request Tests', () {
    test('Get Request Test', () async {
      Response response = await networkManager.dio.get('/todos/1');
      expect(response.statusCode, 200);
    });

    test('Base Path Test', () async {
      expect(NetworkManager.instance.dio.options.baseUrl, baseUrl);
    });
  });

  group('Interceptor Tests', () {
    test('Add Interceptor Test', () async {
      expect(NetworkManager.instance.dio.interceptors.isEmpty, true);
      networkManager.addInterceptor(ApiKeyInterceptor());
      expect(NetworkManager.instance.dio.interceptors.isEmpty, false);
    });
  });
}
