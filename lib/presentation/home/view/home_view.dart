import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_challenge/presentation/detail/view/detail_view.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final String ironManImg =
      'https://www.jedbang.com/materials/images/products/products/3/3284/13728/kotobukiya-kk1-145-ironman-mk-xlv-art-fx-statue-s0-p5-1200x800-i13728.jpg';

  final PagingController<int, CharacterCard> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  Widget build(BuildContext context) {
    _pagingController.appendLastPage(
      List.generate(
        10,
        (index) => CharacterCard(
          url: ironManImg,
          text: "Iron Man",
          subText: "Iron Man is Best" * 10,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => const CharacterDetailView(),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: PagedListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemExtent: 350,
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<CharacterCard>(
            itemBuilder: (context, item, index) {
              return item;
            },
          ),
        ),
      ),
    );
  }
}
