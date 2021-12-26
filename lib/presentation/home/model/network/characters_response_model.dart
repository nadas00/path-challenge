import 'package:json_annotation/json_annotation.dart';

import 'package:path_challenge/product/models/base/base_response_model.dart';

part 'characters_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterResponseModel implements BaseResponseModel<Data> {
  CharacterResponseModel({
    this.attributionHTML,
    this.attributionText,
    this.code,
    this.copyright,
    this.data,
    this.etag,
    this.status,
  });

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseModelFromJson(json);

  @override
  String? attributionHTML;

  @override
  String? attributionText;

  @override
  int? code;

  @override
  String? copyright;

  @override
  Data? data;

  @override
  String? etag;

  @override
  String? status;

  Map<String, dynamic> toJson() => _$CharacterResponseModelToJson(this);

  bool? hasMoreRecords(int limit) => (data?.total ?? 0) > limit;
}

@JsonSerializable(explicitToJson: true)
class Data implements BaseResponseDataModel<List<CharactersModel>> {
  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  int? count;

  @override
  int? limit;

  @override
  int? offset;

  @override
  List<CharactersModel>? results;

  @override
  int? total;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CharactersModel {
  CharactersModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelFromJson(json);

  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final String? resourceURI;
  final List<Urls>? urls;
  final Thumbnail? thumbnail;
  final Series? comics;
  final Series? stories;
  final Series? events;
  final Series? series;

  Map<String, dynamic> toJson() => _$CharactersModelToJson(this);
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
