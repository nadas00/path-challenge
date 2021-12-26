import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_challenge/presentation/home/service/home_service.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';
import 'package:path_challenge/presentation/home/model/network/characters_response_model.dart';

class HomeBlocRepository {
  late final PagingController<int, CharacterCard> pagingController;
  late HomeService _service;
  final String ironManImg =
      'https://www.jedbang.com/materials/images/products/products/3/3284/13728/kotobukiya-kk1-145-ironman-mk-xlv-art-fx-statue-s0-p5-1200x800-i13728.jpg';

  init() {
    pagingController = PagingController<int, CharacterCard>(firstPageKey: 0);

    _service = HomeService();

    fetchNewCharacterData(
      service: _service,
      controller: pagingController,
      pageKey: 0,
      fetchSize: 30,
      maxItemSize: 90,
    );

    updatePageController(
      controller: pagingController,
      model: CharacterResponseModel(),
    );
  }

  fetchNewCharacterData({
    required HomeService service,
    required PagingController<int, CharacterCard> controller,
    required int pageKey,
    required int fetchSize,
    required int maxItemSize,
  }) async {
    CharacterResponseModel? characterResponseModel =
        await _service.fetchCharacters();

    updatePageController(controller: controller, model: characterResponseModel);
  }

  void updatePageController({
    required PagingController<int, CharacterCard> controller,
    required CharacterResponseModel? model,
  }) {
    controller.appendLastPage(
      List.generate(
        model?.data?.results?.length ?? 0,
        (index) => CharacterCard(
          url: createThumbnailUrl(
            path: model?.data?.results?[index].thumbnail?.path,
            extension: model?.data?.results?[index].thumbnail?.extension,
          ),
          text: model?.data?.results?[index].name,
          subText: model?.data?.results?[index].description,
        ),
      ),
    );
  }

  String? createThumbnailUrl(
      {required String? path, required String? extension}) {
    if (path != null && extension != null) {
      print(path + '/landscape_incredible' + extension);
      return path + '/landscape_incredible' + '.' + extension;
    }
    return null;
  }
}
