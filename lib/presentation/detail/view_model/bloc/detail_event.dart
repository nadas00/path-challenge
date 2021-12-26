part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object?> get props => [];
}

class CharacterComicsRequested extends DetailEvent {
  const CharacterComicsRequested({
    required this.startYear,
    required this.characterId,
    required this.limit,
  });

  final int? characterId;
  final int limit;
  final int startYear;

  @override
  List<Object?> get props => [startYear, characterId, limit];
}

class CharacterComicsFetchStatusChanged extends DetailEvent {
  const CharacterComicsFetchStatusChanged(this.status);
  final FetchingStatus status;

  @override
  List<Object> get props => [status];
}
