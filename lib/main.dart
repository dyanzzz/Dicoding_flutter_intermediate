import 'dart:math';

import 'package:flutter/material.dart';

import 'my_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<int> items = [26, 45];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated List Project")),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return MyItem(
            item: items[index],
            animation: animation,
            onDelete: () {
              final item = items.removeAt(index);
              listKey.currentState?.removeItem(
                index,
                (_, animation) => MyItem(item: item, animation: animation),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final randNumber = Random().nextInt(100);
          const index = 0;
          items.insert(index, randNumber);
          listKey.currentState?.insertItem(index);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
