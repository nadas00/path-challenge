// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponseModel _$CharacterResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharacterResponseModel(
      attributionHTML: json['attributionHTML'] as String?,
      attributionText: json['attributionText'] as String?,
      code: json['code'] as int?,
      copyright: json['copyright'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      etag: json['etag'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CharacterResponseModelToJson(
        CharacterResponseModel instance) =>
    <String, dynamic>{
      'attributionHTML': instance.attributionHTML,
      'attributionText': instance.attributionText,
      'code': instance.code,
      'copyright': instance.copyright,
      'data': instance.data?.toJson(),
      'etag': instance.etag,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      offset: json['offset'] as int?,
      limit: json['limit'] as int?,
      total: json['total'] as int?,
      count: json['count'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CharactersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'count': instance.count,
      'limit': instance.limit,
      'offset': instance.offset,
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };

CharactersModel _$CharactersModelFromJson(Map<String, dynamic> json) =>
    CharactersModel(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      suffix: json['suffix'] as String?,
      fullName: json['fullName'] as String?,
      modified: json['modified'] as String?,
      resourceURI: json['resourceURI'] as String?,
      urls: (json['urls'] as List<dynamic>?)
          ?.map((e) => Urls.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      series: json['series'] == null
          ? null
          : Series.fromJson(json['series'] as Map<String, dynamic>),
      stories: json['stories'] == null
          ? null
          : Series.fromJson(json['stories'] as Map<String, dynamic>),
      comics: json['comics'] == null
          ? null
          : Series.fromJson(json['comics'] as Map<String, dynamic>),
      events: json['events'] == null
          ? null
          : Series.fromJson(json['events'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharactersModelToJson(CharactersModel instance) =>
    <String, dynamic>{
      'comics': instance.comics?.toJson(),
      'events': instance.events?.toJson(),
      'firstName': instance.firstName,
      'fullName': instance.fullName,
      'id': instance.id,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'modified': instance.modified,
      'resourceURI': instance.resourceURI,
      'series': instance.series?.toJson(),
      'stories': instance.stories?.toJson(),
      'suffix': instance.suffix,
      'thumbnail': instance.thumbnail?.toJson(),
      'urls': instance.urls?.map((e) => e.toJson()).toList(),
    };

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      available: json['available'] as int?,
      returned: json['returned'] as int?,
      collectionURI: json['collectionURI'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'available': instance.available,
      'collectionURI': instance.collectionURI,
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'returned': instance.returned,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      resourceURI: json['resourceURI'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'name': instance.name,
      'resourceURI': instance.resourceURI,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      path: json['path'] as String?,
      extension: json['extension'] as String?,
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'extension': instance.extension,
      'path': instance.path,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
    };
