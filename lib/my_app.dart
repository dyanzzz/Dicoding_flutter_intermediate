import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FlavorConfig.instance.values.titleApp,
      theme: ThemeData(primarySwatch: FlavorConfig.instance.color),
      home: const Home(),
    );
  }
}
