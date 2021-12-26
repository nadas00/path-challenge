import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_challenge/core/utils/enums/fetching_status_enum.dart';

import 'package:path_challenge/core/utils/extensions/widget/sliver_to_box_adapter_extension.dart';
import 'package:path_challenge/presentation/detail/view_model/bloc/detail_bloc.dart';
import 'package:path_challenge/presentation/detail/view_model/bloc/detail_bloc_repository.dart';
import 'package:path_challenge/presentation/home/model/network/characters_response_model.dart';
import 'package:path_challenge/presentation/widget/cached_network_image/cached_network_image_fail_widget.dart';
import 'package:path_challenge/presentation/widget/shared/network_loading_widget.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';
import 'package:path_challenge/presentation/detail/model/character_comics_response_model.dart';

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
              ).toSliver,
              const SizedBox(height: 20).toSliver,
            ],
            body: RepositoryProvider(
              create: (_) => DetailBlocRepository()..init(),
              child: BlocProvider(
                create: (context) =>
                    DetailBloc(repository: context.read<DetailBlocRepository>())
                      ..add(
                        CharacterComicsRequested(
                          startYear: 2005,
                          characterId: charactersModel.id,
                          limit: 10,
                        ),
                      ),
                child: BlocBuilder<DetailBloc, DetailState>(
                  builder: (context, state) {
                    switch (state.characterFetchStatus) {
                      case FetchingStatus.loaded:
                        return _CharacterComicsListView(
                          comics: context.read<DetailBlocRepository>().comics,
                        );
                      case FetchingStatus.failed:
                        return Text(
                          "Failed to Load Comics",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        );
                      case FetchingStatus.loading:
                        return const NetworkLoadingWidget();
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
