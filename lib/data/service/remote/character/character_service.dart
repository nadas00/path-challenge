import 'package:dio/dio.dart';
import 'package:path_challenge/product/utils/enums/api_route_enums.dart';
import 'package:retrofit/retrofit.dart';
import 'package:path_challenge/presentation/home/model/network/characters_response_model.dart';
import 'package:path_challenge/presentation/detail/model/character_comics_response_model.dart';

part 'character_service.g.dart';

@RestApi()
abstract class CharacterService {
  factory CharacterService(Dio dio, {String baseUrl}) = _CharacterService;

  @GET(ApiRoutes.characters)
  Future<HttpResponse<CharacterResponseModel>> create({
    @Path('limit') required int limit,
    @Path('offset') required int offset,
  });

  @GET(ApiRoutes.charactersComics)
  Future<HttpResponse<CharacterComicsResponseModel>> getCharactersComics({
    @Path('characterId') required int characterId,
    @Path('startYear') required int startYear,
    @Path('limit') required int limit,
  });
}
