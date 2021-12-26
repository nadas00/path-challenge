import 'package:flutter/material.dart';

import 'package:path_challenge/core/utils/extensions/widget/sliver_to_box_adapter_extension.dart';
import 'package:path_challenge/presentation/home/model/network/characters_response_model.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';

part 'widget/character_comics_list_view.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({
    Key? key,
    required this.charactersModel,
  }) : super(key: key);

  final CharactersModel charactersModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                expandedHeight: 350,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: CharacterCard(
                    displayImageOnly: true,
                    charactersModel: charactersModel,
                  ),
                ),
              ),
              const SizedBox(height: 20).toSliver,
              Text(
                charactersModel.name ?? "Name Unknown",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ).toSliver,
              const SizedBox(height: 20).toSliver,
              Text(
                charactersModel.description ?? "Description Unknown",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.white),
              ).toSliver
            ],
            body: _CharacterComicsListView(comics: charactersModel.comics),
          ),
        ),
      ),
    );
  }
}
