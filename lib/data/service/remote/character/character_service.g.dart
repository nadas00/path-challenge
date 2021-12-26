// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unnecessary_brace_in_string_interps

part of 'character_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CharacterService implements CharacterService {
  _CharacterService(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<CharacterResponseModel>> create(
      {required limit, required offset}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CharacterResponseModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/characters?limit=${limit}&offset=${offset}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CharacterResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CharacterComicsResponseModel>> getCharactersComics(
      {required characterId, required startYear, required limit}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<CharacterComicsResponseModel>>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/characters/${characterId}/comics?startYear=${startYear}&orderBy=-onsaleDate&limit=${limit}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CharacterComicsResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
