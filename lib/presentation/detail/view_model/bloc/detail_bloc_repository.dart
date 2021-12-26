import 'dart:async';

import 'package:path_challenge/core/utils/enums/fetching_status_enum.dart';
import 'package:path_challenge/presentation/detail/model/character_comics_response_model.dart';
import 'package:path_challenge/presentation/detail/service/detail_service.dart';

class DetailBlocRepository {
  final StreamController<FetchingStatus> characterComicsFetchStream =
      StreamController<FetchingStatus>();

  CharacterComicsResponseModel? comicsResponseModel;
  List<CharacterComics>? get comics => comicsResponseModel?.data?.results;

  late DetailService _service;

  Stream<FetchingStatus> get characterComicsFetchStreamStatus async* {
    yield* characterComicsFetchStream.stream;
  }

  init() {
    initService();
  }

  fetchCharacterComics({
    required int startYear,
    required int characterId,
    required int limit,
  }) async {
    characterComicsFetchStream.add(FetchingStatus.loading);
    comicsResponseModel = await _service.fetchCharacterComics(
      startYear: startYear,
      characterId: characterId,
      limit: limit,
    );
    try {
      characterComicsFetchStream.add(FetchingStatus.loaded);
    } catch (e) {
      print(e);
      characterComicsFetchStream.add(FetchingStatus.failed);
    }
  }

  void initService() {
    _service = DetailService();
  }

  void dispose() {
    characterComicsFetchStream.close();
  }
}
