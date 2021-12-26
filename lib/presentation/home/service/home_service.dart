import 'dart:io';

import 'package:path_challenge/core/manager/network/network_manager.dart';
import 'package:path_challenge/data/service/remote/character/character_service.dart';
import 'package:path_challenge/presentation/home/model/network/characters_response_model.dart';
import 'package:retrofit/retrofit.dart';

class HomeService {
  CharacterResponseModel? _characterResponseModel;
  CharacterService? _characterService;

  Future<CharacterResponseModel?> fetchCharacters() async {
    _characterService ??= CharacterService(NetworkManager.instance.dio);
    final HttpResponse<CharacterResponseModel> result =
        await _characterService!.create();
    _characterResponseModel = manageResponse(result);
    return _characterResponseModel;
  }

  manageResponse<T>(HttpResponse<CharacterResponseModel> result) {
    if (result.response.statusCode == HttpStatus.ok) {
      _characterResponseModel = result.data;
    }
    return _characterResponseModel;
  }
}
