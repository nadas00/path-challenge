import 'package:json_annotation/json_annotation.dart';

import 'package:path_challenge/product/models/base/base_response_model.dart';

part 'character_comics_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterComicsResponseModel extends BaseResponseModel<Data> {
  CharacterComicsResponseModel();
  factory CharacterComicsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterComicsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterComicsResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data extends BaseResponseDataModel<List<CharacterComics>> {
  Data();
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CharacterComics {
  int? id;
  int? digitalId;
  String? title;
  double? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<TextObjects>? textObjects;
  String? resourceURI;
  List<Urls>? urls;
  Series? series;
  List<Series>? variants;
  List<Series>? collections;
  List<Series>? collectedIssues;
  List<Dates>? dates;
  List<Prices>? prices;
  Thumbnail? thumbnail;
  List<Thumbnail>? images;
  Creators? creators;
  Creators? characters;
  Creators? stories;
  Creators? events;
  CharacterComics({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceURI,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });
  factory CharacterComics.fromJson(Map<String, dynamic> json) =>
      _$CharacterComicsFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterComicsToJson(this);

  bool get hasThumbnail =>
      (thumbnail?.extension != null && thumbnail?.path != null);
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
class TextObjects {
  String? type;
  String? language;
  String? text;
  TextObjects({
    this.type,
    this.language,
    this.text,
  });
  factory TextObjects.fromJson(Map<String, dynamic> json) =>
      _$TextObjectsFromJson(json);
  Map<String, dynamic> toJson() => _$TextObjectsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Urls {
  String? type;
  String? url;
  Urls({
    this.type,
    this.url,
  });
  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);
  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Series {
  String? resourceURI;
  String? name;
  Series({
    this.resourceURI,
    this.name,
  });
  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
  Map<String, dynamic> toJson() => _$SeriesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Dates {
  String? type;
  String? date;
  Dates({
    this.type,
    this.date,
  });
  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
  Map<String, dynamic> toJson() => _$DatesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Prices {
  String? type;
  double? price;
  Prices({
    this.type,
    this.price,
  });
  factory Prices.fromJson(Map<String, dynamic> json) => _$PricesFromJson(json);
  Map<String, dynamic> toJson() => _$PricesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Thumbnail {
  String? path;
  String? extension;
  Thumbnail({
    this.path,
    this.extension,
  });
  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Creators {
  int? available;
  int? returned;
  String? collectionURI;
  List<Items>? items;
  Creators({
    this.available,
    this.returned,
    this.collectionURI,
    this.items,
  });
  factory Creators.fromJson(Map<String, dynamic> json) =>
      _$CreatorsFromJson(json);
  Map<String, dynamic> toJson() => _$CreatorsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Items {
  String? resourceURI;
  String? name;
  String? role;
  Items({
    this.resourceURI,
    this.name,
    this.role,
  });
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
