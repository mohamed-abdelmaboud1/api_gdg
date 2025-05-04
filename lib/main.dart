import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:marketi_ecommerce/features/authentication/login/ui/views/login_view.dart';

import 'core/di/service_locator.dart';
import 'core/helpers/cache_manager.dart';

void main() async {
  // LoginRepo loginRepo = LoginRepo();
  setup();
  await CacheManager.init();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MarketiApp(),
    ),
  );
}

class MarketiApp extends StatelessWidget {
  const MarketiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}
