import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'flavor_type.dart';
import 'flavor_values.dart';
import 'my_app.dart';

void main() {
  FlavorConfig(
    flavor: FlavorType.prod,
    color: Colors.blue,
    values: const FlavorValues(titleApp: "Production App"),
  );

  runApp(const MyApp());
}
