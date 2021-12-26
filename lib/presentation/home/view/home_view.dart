import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_challenge/presentation/detail/view/detail_view.dart';
import 'package:path_challenge/presentation/home/view_model/home_bloc_repository.dart';
import 'package:path_challenge/presentation/widget/shared/network_loading_widget.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';
import 'package:shimmer/shimmer.dart';
part '../view/widget/fetching_place_holder_cards.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: RepositoryProvider(
          create: (_) => HomeRepository()..init(),
          child: Builder(
            builder: (context) => PagedListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              pagingController: context.read<HomeRepository>().pagingController,
              builderDelegate: PagedChildBuilderDelegate<CharacterCard>(
                firstPageProgressIndicatorBuilder: (context) =>
                    const _FetchingPlaceHolderCards(initialFetch: true),
                newPageProgressIndicatorBuilder: (context) =>
                    const _FetchingPlaceHolderCards(),
                itemBuilder: (context, CharacterCard item, index) {
                  return GestureDetector(
                    child: item,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => CharacterDetailView(
                            charactersModel: item.charactersModel,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
