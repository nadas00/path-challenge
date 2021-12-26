part of 'detail_bloc.dart';

class DetailState extends Equatable {
  const DetailState({
    this.characterFetchStatus = FetchingStatus.unknown,
  });

  final FetchingStatus characterFetchStatus;

  @override
  List<Object> get props => [characterFetchStatus];

  DetailState copyWith({
    FetchingStatus? characterFetchStatus,
    CharacterComics? characterComics,
  }) {
    return DetailState(
      characterFetchStatus: characterFetchStatus ?? this.characterFetchStatus,
    );
  }
}
