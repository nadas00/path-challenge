import 'package:flutter/material.dart';
import 'package:path_challenge/core/utils/extensions/widget/sliver_to_box_adapter_extension.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';

part 'widget/character_comics_list_view.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({Key? key}) : super(key: key);

  final String ironManImg =
      'https://www.jedbang.com/materials/images/products/products/3/3284/13728/kotobukiya-kk1-145-ironman-mk-xlv-art-fx-statue-s0-p5-1200x800-i13728.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                expandedHeight: 350,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: CharacterCard(
                    url: ironManImg,
                  ),
                ),
              ),
              const SizedBox(height: 20).toSliver,
              Text(
                "Iron Man",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ).toSliver,
              const SizedBox(height: 20).toSliver,
              Text(
                "Iron Man" * 30,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.white),
              ).toSliver
            ],
            body: const _CharacterComicsListView(),
          ),
        ),
      ),
    );
  }
}
