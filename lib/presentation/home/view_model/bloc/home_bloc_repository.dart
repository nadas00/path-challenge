import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_challenge/presentation/home/service/home_service.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';

class HomeBlocRepository {
  late final PagingController<int, CharacterCard> pagingController;
  late HomeService _service;
  final String ironManImg =
      'https://www.jedbang.com/materials/images/products/products/3/3284/13728/kotobukiya-kk1-145-ironman-mk-xlv-art-fx-statue-s0-p5-1200x800-i13728.jpg';

  init() {
    pagingController = PagingController<int, CharacterCard>(firstPageKey: 0);

    _service = HomeService();
    //_service.fetchCharacters();
    //TODO: CHANGE MOCK DATA
    pagingController.appendLastPage(
      List.generate(
        10,
        (index) => CharacterCard(
          url: ironManImg,
          text: "Iron Man",
          subText: "Iron Man is Best" * 10,
        ),
      ),
    );
  }

  fetchNewCharacterData(
    PagingController controller,
    int pageKey,
    int fetchSize,
    int maxItemSize,
  ) {
    // TODO: IMLEMENT METHOD
  }
}
