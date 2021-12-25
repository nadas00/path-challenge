import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_challenge/core/manager/network/network_manager.dart';

void main() {
  late INetworkManager networkManager;
  group('Network Manager Request Tests', () {
    setUp(() {
      networkManager = NetworkManager.instance
        ..init("https://jsonplaceholder.typicode.com", {});
    });
    test('Get Request', () async {
      Response response = await networkManager.dio.get('/todos/1');
      expect(response.statusCode, 200);
    });
  });
}
