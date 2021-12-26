import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_challenge/core/utils/enums/fetching_status_enum.dart';
import 'package:path_challenge/presentation/detail/view_model/bloc/detail_bloc_repository.dart';
import 'package:path_challenge/presentation/detail/model/character_comics_response_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({required DetailBlocRepository repository})
      : _repository = repository,
        super(const DetailState()) {
    on<CharacterComicsRequested>(_onCharacterComicsRequested);
    on<CharacterComicsFetchStatusChanged>(_onCharacterComicsFetchStatusChanged);

    _characterComicsStreamSubscription =
        _repository.characterComicsFetchStreamStatus.listen((status) {
      add(CharacterComicsFetchStatusChanged(status));
    });
  }

  late StreamSubscription<FetchingStatus> _characterComicsStreamSubscription;
  final DetailBlocRepository _repository;

  @override
  Future<void> close() {
    _characterComicsStreamSubscription.cancel();
    _repository.dispose();
    return super.close();
  }

  FutureOr<void> _onCharacterComicsRequested(
    CharacterComicsRequested event,
    Emitter<DetailState> emit,
  ) {
    if (event.characterId != null) {
      _repository.fetchCharacterComics(
        startYear: event.startYear,
        characterId: event.characterId!,
        limit: event.limit,
      );
    }
  }

  FutureOr<void> _onCharacterComicsFetchStatusChanged(
    CharacterComicsFetchStatusChanged event,
    Emitter<DetailState> emit,
  ) {
    emit(state.copyWith(characterFetchStatus: event.status));
  }
}
