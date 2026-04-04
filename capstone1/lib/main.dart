
import 'package:capstone1/core/configuration.dart.dart';
import 'package:capstone1/routes/route_app.dart';
import 'package:flutter/material.dart';

void main() {
  Configuration.configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteApp.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

