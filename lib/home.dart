import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'flavor_config.dart';
import 'flutter_mode_config.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flavor Mode")),
      body: FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
          if (!snapshot.hasData) return Container();
          PackageInfo? _packageInfo = snapshot.data;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Belajar Flutter Flavor dan Flutter Mode",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26),
                ),

                Divider(height: 32, thickness: 2),

                Text(
                  "Flavor: ${FlavorConfig.instance.flavor.name}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),

                Text(
                  "Mode: ${FlutterModeConfig.flutterMode}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22),
                ),

                const Divider(height: 32, thickness: 2),

                Text(
                  "App Name : ${_packageInfo?.appName}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22),
                ),

                Text(
                  "Package Name : ${_packageInfo?.packageName}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22),
                ),

                Text(
                  "Version Name : ${_packageInfo?.version}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
