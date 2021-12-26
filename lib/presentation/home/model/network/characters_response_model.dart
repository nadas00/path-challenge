import 'package:json_annotation/json_annotation.dart';

import 'package:path_challenge/product/models/base/base_response_model.dart';

part 'characters_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterResponseModel extends BaseResponseModel<Data> {
  CharacterResponseModel();

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseModelToJson(this);

  bool? hasMoreRecords(int limit) => (data?.total ?? 0) > limit;
}

@JsonSerializable(explicitToJson: true)
class Data extends BaseResponseDataModel<List<CharactersModel>> {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CharactersModel {
  CharactersModel({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceURI,
    this.urls,
    this.thumbnail,
    this.comics,
    this.stories,
    this.events,
    this.series,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelFromJson(json);

  final Series? comics;
  final String? description;
  final Series? events;
  final int? id;
  final String? modified;
  final String? name;
  final String? resourceURI;
  final Series? series;
  final Series? stories;
  final Thumbnail? thumbnail;
  final List<Urls>? urls;

  Map<String, dynamic> toJson() => _$CharactersModelToJson(this);

  bool get hasThumbnail =>
      (thumbnail?.extension != null && thumbnail?.path != null);

  bool get hasCharacterName => name != null;

  bool get hasDescription => description != null;

  bool get hasCharacterNameAndDescription =>
      (name != null && description != null);

  String? get createThumbnailUrl {
    if (thumbnail?.path != null && thumbnail?.extension != null) {
      return thumbnail!.path! +
          '/landscape_incredible' +
          '.' +
          thumbnail!.extension!;
    }
    return null;
  }
}

@JsonSerializable(explicitToJson: true)
class Series {
  Series({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  final int? available;
  final String? collectionURI;
  final List<Items>? items;
  final int? returned;

  Map<String, dynamic> toJson() => _$SeriesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Items {
  Items({
    required this.resourceURI,
    required this.name,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  final String? name;
  final String? resourceURI;

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Thumbnail {
  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  final String? extension;
  final String? path;

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Urls {
  Urls({
    required this.type,
    required this.url,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  final String? type;
  final String? url;

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
