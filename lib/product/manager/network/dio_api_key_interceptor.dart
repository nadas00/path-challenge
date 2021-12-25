import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_challenge/core/utils/enums/env_fields.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final ts = DateTime.now().toIso8601String();

    final publicKey = dotenv.get(EnvFields.apiKey.name);
    final privateKey = dotenv.get(EnvFields.privateApiKey.name);

    final String hash = generateHash(publicKey, privateKey, ts);
    final String newPath =
        generatePathWithAuth(options.path, ts, hash, publicKey);

    options.path = newPath;

    handler.next(options);
  }

  String generateHash(
    String apiKey,
    String privateApiKey,
    String ts,
  ) {
    return md5.convert(utf8.encode(ts + privateApiKey + apiKey)).toString();
  }

  String generatePathWithAuth(
    String path,
    String ts,
    String hash,
    String apiKey,
  ) {
    return '$path?ts=$ts&apikey=$apiKey&hash=$hash';
  }
}
