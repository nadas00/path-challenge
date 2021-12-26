import 'dart:io';

import 'package:path_challenge/core/manager/network/network_manager.dart';
import 'package:path_challenge/data/service/remote/character/character_service.dart';
import 'package:path_challenge/presentation/detail/model/character_comics_response_model.dart';
import 'package:retrofit/retrofit.dart';

class DetailService {
  CharacterComicsResponseModel? _characterComicsResponseModel;
  CharacterService? _characterService;

  Future<CharacterComicsResponseModel?> fetchCharacterComics({
    required int startYear,
    required int characterId,
    required int limit,
  }) async {
    _characterService ??= CharacterService(NetworkManager.instance.dio);
    final HttpResponse<CharacterComicsResponseModel> result =
        await _characterService!.getCharactersComics(
      characterId: characterId,
      startYear: startYear,
      limit: limit,
    );
    _characterComicsResponseModel = manageResponse(result);
    return _characterComicsResponseModel;
  }

  manageResponse<T>(HttpResponse<CharacterComicsResponseModel> result) {
    if (result.response.statusCode == HttpStatus.ok) {
      _characterComicsResponseModel = result.data;
    }
    return _characterComicsResponseModel;
  }
}
