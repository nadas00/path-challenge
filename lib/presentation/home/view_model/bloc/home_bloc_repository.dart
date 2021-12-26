import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_challenge/presentation/home/service/home_service.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';
import 'package:path_challenge/presentation/home/model/network/characters_response_model.dart';

class HomeBlocRepository {
  late final PagingController<int, CharacterCard> pagingController;
  late HomeService _service;
  late int _offset;
  late int _limit;
  int? _total;

  init() {
    _offset = 0;
    _limit = 30;
    _service = HomeService();
    pagingController = PagingController<int, CharacterCard>(firstPageKey: 0);

    pagingController.addPageRequestListener(
      (pageKey) {
        fetchNewCharacterData(
          controller: pagingController,
          limit: _limit,
          offset: _offset,
          service: _service,
        );
      },
    );
  }

  Future<void> fetchNewCharacterData({
    required HomeService service,
    required PagingController<int, CharacterCard> controller,
    required int offset,
    required int limit,
    int? total,
  }) async {
    CharacterResponseModel? characterResponseModel =
        await _service.fetchCharacters(limit: limit, offset: offset);

    setTotalCount(characterResponseModel?.data?.total);

    updatePageController(
        controller: controller,
        model: characterResponseModel,
        total: _total ?? 0,
        limit: _limit);

    updateOffset();
  }

  void updatePageController({
    required PagingController<int, CharacterCard> controller,
    required CharacterResponseModel? model,
    required int limit,
    required int total,
  }) {
    if (model?.hasMoreRecords(limit) ?? false) {
      controller.appendPage(
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
          _limit);
    } else {
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
  }

  String? createThumbnailUrl(
      {required String? path, required String? extension}) {
    if (path != null && extension != null) {
      return path + '/landscape_incredible' + '.' + extension;
    }
    return null;
  }

  void setTotalCount(int? total) {
    if (total != null) {
      _total = total;
    }
  }

  void updateOffset() {
    print(_offset);
    print(_limit);

    _offset += _limit;
  }
}
