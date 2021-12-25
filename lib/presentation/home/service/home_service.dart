import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_challenge/core/manager/network/network_manager.dart';
import 'package:path_challenge/product/utils/enums/api_route_enums.dart';

class HomeService with InstanceBox {
  fetchCharacters() async {
    final Response<dynamic> response = await manager.get(routes.characters);
    debugPrint(response.data);
  }
}

mixin InstanceBox {
  Dio get manager => NetworkManager.instance.dio;
  ApiRoutes get routes => ApiRoutes.instance;
}
