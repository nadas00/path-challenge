// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_comics_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterComicsResponseModel _$CharacterComicsResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharacterComicsResponseModel()
      ..attributionHTML = json['attributionHTML'] as String?
      ..attributionText = json['attributionText'] as String?
      ..code = json['code'] as int?
      ..copyright = json['copyright'] as String?
      ..data = json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>)
      ..etag = json['etag'] as String?
      ..status = json['status'] as String?;

Map<String, dynamic> _$CharacterComicsResponseModelToJson(
        CharacterComicsResponseModel instance) =>
    <String, dynamic>{
      'attributionHTML': instance.attributionHTML,
      'attributionText': instance.attributionText,
      'code': instance.code,
      'copyright': instance.copyright,
      'data': instance.data?.toJson(),
      'etag': instance.etag,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..count = json['count'] as int?
  ..limit = json['limit'] as int?
  ..offset = json['offset'] as int?
  ..results = (json['results'] as List<dynamic>?)
      ?.map((e) => CharacterComics.fromJson(e as Map<String, dynamic>))
      .toList()
  ..total = json['total'] as int?;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'count': instance.count,
      'limit': instance.limit,
      'offset': instance.offset,
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };

CharacterComics _$CharacterComicsFromJson(Map<String, dynamic> json) =>
    CharacterComics(
      id: json['id'] as String?,
      digitalId: json['digitalId'] as String?,
      title: json['title'] as String?,
      issueNumber: json['issueNumber'] as String?,
      variantDescription: json['variantDescription'] as String?,
      description: json['description'] as String?,
      modified: json['modified'] as String?,
      isbn: json['isbn'] as String?,
      upc: json['upc'] as String?,
      diamondCode: json['diamondCode'] as String?,
      ean: json['ean'] as String?,
      issn: json['issn'] as String?,
      format: json['format'] as String?,
      pageCount: json['pageCount'] as String?,
      textObjects: (json['textObjects'] as List<dynamic>?)
          ?.map((e) => TextObjects.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceURI: json['resourceURI'] as String?,
      urls: (json['urls'] as List<dynamic>?)
          ?.map((e) => Urls.fromJson(e as Map<String, dynamic>))
          .toList(),
      series: json['series'] == null
          ? null
          : Series.fromJson(json['series'] as Map<String, dynamic>),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Series.fromJson(e as Map<String, dynamic>))
          .toList(),
      collections: (json['collections'] as List<dynamic>?)
          ?.map((e) => Series.fromJson(e as Map<String, dynamic>))
          .toList(),
      collectedIssues: (json['collectedIssues'] as List<dynamic>?)
          ?.map((e) => Series.fromJson(e as Map<String, dynamic>))
          .toList(),
      dates: (json['dates'] as List<dynamic>?)
          ?.map((e) => Dates.fromJson(e as Map<String, dynamic>))
          .toList(),
      prices: (json['prices'] as List<dynamic>?)
          ?.map((e) => Prices.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Thumbnail.fromJson(e as Map<String, dynamic>))
          .toList(),
      creators: json['creators'] == null
          ? null
          : Creators.fromJson(json['creators'] as Map<String, dynamic>),
      characters: json['characters'] == null
          ? null
          : Creators.fromJson(json['characters'] as Map<String, dynamic>),
      stories: json['stories'] == null
          ? null
          : Creators.fromJson(json['stories'] as Map<String, dynamic>),
      events: json['events'] == null
          ? null
          : Creators.fromJson(json['events'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterComicsToJson(CharacterComics instance) =>
    <String, dynamic>{
      'id': instance.id,
      'digitalId': instance.digitalId,
      'title': instance.title,
      'issueNumber': instance.issueNumber,
      'variantDescription': instance.variantDescription,
      'description': instance.description,
      'modified': instance.modified,
      'isbn': instance.isbn,
      'upc': instance.upc,
      'diamondCode': instance.diamondCode,
      'ean': instance.ean,
      'issn': instance.issn,
      'format': instance.format,
      'pageCount': instance.pageCount,
      'textObjects': instance.textObjects?.map((e) => e.toJson()).toList(),
      'resourceURI': instance.resourceURI,
      'urls': instance.urls?.map((e) => e.toJson()).toList(),
      'series': instance.series?.toJson(),
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
      'collections': instance.collections?.map((e) => e.toJson()).toList(),
      'collectedIssues':
          instance.collectedIssues?.map((e) => e.toJson()).toList(),
      'dates': instance.dates?.map((e) => e.toJson()).toList(),
      'prices': instance.prices?.map((e) => e.toJson()).toList(),
      'thumbnail': instance.thumbnail?.toJson(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'creators': instance.creators?.toJson(),
      'characters': instance.characters?.toJson(),
      'stories': instance.stories?.toJson(),
      'events': instance.events?.toJson(),
    };

TextObjects _$TextObjectsFromJson(Map<String, dynamic> json) => TextObjects(
      type: json['type'] as String?,
      language: json['language'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$TextObjectsToJson(TextObjects instance) =>
    <String, dynamic>{
      'type': instance.type,
      'language': instance.language,
      'text': instance.text,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
    };

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      resourceURI: json['resourceURI'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'resourceURI': instance.resourceURI,
      'name': instance.name,
    };

Dates _$DatesFromJson(Map<String, dynamic> json) => Dates(
      type: json['type'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$DatesToJson(Dates instance) => <String, dynamic>{
      'type': instance.type,
      'date': instance.date,
    };

Prices _$PricesFromJson(Map<String, dynamic> json) => Prices(
      type: json['type'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      path: json['path'] as String?,
      extension: json['extension'] as String?,
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'path': instance.path,
      'extension': instance.extension,
    };

Creators _$CreatorsFromJson(Map<String, dynamic> json) => Creators(
      available: json['available'] as String?,
      returned: json['returned'] as String?,
      collectionURI: json['collectionURI'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreatorsToJson(Creators instance) => <String, dynamic>{
      'available': instance.available,
      'returned': instance.returned,
      'collectionURI': instance.collectionURI,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      resourceURI: json['resourceURI'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'resourceURI': instance.resourceURI,
      'name': instance.name,
      'role': instance.role,
    };
