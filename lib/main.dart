import 'package:earth_haven/core/style/dark_theme.dart';
import 'package:earth_haven/core/style/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/functions/hive_setup.dart';
import 'core/functions/setup_service_locator.dart';
import 'core/functions/system_ui_overlay_style.dart';
import 'core/utils/app_router.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  systemStatesNavigationBar();
  setupServiceLocator();
  await hiveSetup();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}