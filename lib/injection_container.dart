import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'core/profile/profile_injection.dart';
import 'core/user/user_injection.dart';
import 'shared/platform/network_info.dart';
import 'src/authentication/authentication_injection.dart';
import 'src/menu/menu_injection.dart';

/// Service locator instance
final sl = GetIt.instance;

/// Initialize all injections
Future<void> init() async {
  ///! Core
  // User dependency
  initUser();

  // Profile dependency
  initProfile();

  ///! Features
  // Authentication Dependency
  initAuthentication();

  // Menu Dependency
  initMenu();

  ///! External
  sl
    ..registerLazySingleton<HiveInterface>(() => Hive)
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);
  // ..registerLazySingleton(ImagePicker.new)
  // ..registerFactory<FirebaseMessaging>(() => FirebaseMessaging.instance)
  // ..registerFactory<FlutterLocalNotificationsPlugin>(
  //     FlutterLocalNotificationsPlugin.new);
}
