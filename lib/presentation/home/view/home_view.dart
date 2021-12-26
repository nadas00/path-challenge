import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_challenge/presentation/detail/view/detail_view.dart';
import 'package:path_challenge/presentation/home/view_model/bloc/home_bloc.dart';
import 'package:path_challenge/presentation/home/view_model/bloc/home_bloc_repository.dart';
import 'package:path_challenge/presentation/widget/character/character_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  final String ironManImg =
      'https://www.jedbang.com/materials/images/products/products/3/3284/13728/kotobukiya-kk1-145-ironman-mk-xlv-art-fx-statue-s0-p5-1200x800-i13728.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: RepositoryProvider(
          create: (_) => HomeBlocRepository()..init(),
          child: BlocProvider(
            create: (_) => HomeBloc(),
            child: Builder(
              builder: (context) {
                return BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) =>
                      PagedListView<int, CharacterCard>(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemExtent: 350,
                    pagingController:
                        context.read<HomeBlocRepository>().pagingController,
                    builderDelegate: PagedChildBuilderDelegate<CharacterCard>(
                      itemBuilder: (context, item, index) {
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
