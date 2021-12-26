import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_challenge/core/manager/network/network_manager.dart';
import 'package:path_challenge/product/utils/enums/api_route_enums.dart';
import 'package:path_challenge/presentation/home/model/network/characters_response_model.dart';

class HomeService with _InstanceBox {
  CharacterResponseModel? characterResponseModel;

  Future<CharacterResponseModel?> fetchCharacters() async {
    final Response<dynamic> response = await manager.get(routes.characters);
    if (response.statusCode == HttpStatus.ok) {
      characterResponseModel = _controlResponse(response);
    }
    print(characterResponseModel?.toJson());
    return characterResponseModel;
  }
}

CharacterResponseModel? _controlResponse(Response<dynamic> response) {
  if (response.data is Map<String, dynamic>) {
    return CharacterResponseModel.fromJson(response.data);
  } else {
    return null;
  }
}

mixin _InstanceBox {
  Dio get manager => NetworkManager.instance.dio;
  ApiRoutes get routes => ApiRoutes.instance;
}
