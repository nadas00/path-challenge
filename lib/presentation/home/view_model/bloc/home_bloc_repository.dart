import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_challenge/presentation/home/service/home_service.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';
import 'package:path_challenge/presentation/home/model/network/characters_response_model.dart';

class HomeBlocRepository {
  late final PagingController<int, CharacterCard> pagingController;

  late int _limit;
  late int _offset;
  late HomeService _service;
  int? _total;

  init() {
    initPagingValues();
    initService();
    initPaginationController();
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
      limit: _limit,
    );
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
            (index) {
              final currentModel = model?.data?.results?[index];
              return CharacterCard(charactersModel: currentModel!);
            },
          ),
          _limit);
    } else {
      controller.appendLastPage(
        List.generate(
          model?.data?.results?.length ?? 0,
          (index) {
            final currentModel = model?.data?.results?[index];
            return CharacterCard(charactersModel: currentModel!);
          },
        ),
      );
    }
  }

  void initPaginationController() {
    pagingController = PagingController<int, CharacterCard>(firstPageKey: 0);
    pagingController.addPageRequestListener(
      (pageKey) {
        fetchNewCharacterData(
          controller: pagingController,
          limit: _limit,
          offset: _offset,
          service: _service,
        );
        updateOffset();
      },
    );
  }

  void initPagingValues() {
    _offset = 0;
    _limit = 30;
  }

  void setTotalCount(int? total) {
    if (total != null) {
      _total = total;
    }
  }

  void updateOffset() {
    _offset += _limit;
  }

  void initService() {
    _service = HomeService();
  }
}
