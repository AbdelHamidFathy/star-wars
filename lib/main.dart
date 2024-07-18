import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:star_wars/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}
