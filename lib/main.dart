import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_challenge/core/manager/network/network_manager.dart';
import 'package:path_challenge/core/utils/enums/env_fields.dart';
import 'package:path_challenge/presentation/home/view/home_view.dart';
import 'package:path_challenge/root_app.dart';

Future<void> main() async {
  await dotenv.load();
  NetworkManager.instance.init(dotenv.get(EnvFields.baseUrl.name), {});
  runApp(const RootApp());
}
