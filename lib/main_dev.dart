import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'flavor_type.dart';
import 'flavor_values.dart';
import 'my_app.dart';

void main() {
  FlavorConfig(
    flavor: FlavorType.dev,
    color: Colors.orange,
    values: const FlavorValues(titleApp: "Development App"),
  );

  runApp(const MyApp());
}
