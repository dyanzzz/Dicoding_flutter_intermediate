import 'package:flutter/material.dart';

class MyItem extends StatelessWidget {
  final int item;
  final Animation<double> animation;
  final Function()? onDelete;

  const MyItem({
    super.key,
    required this.item,
    required this.animation,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: Card(
        color: Colors.primaries[item % Colors.primaries.length],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Number $item",
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              IconButton(
                onPressed: () => onDelete!(),
                icon: const Icon(Icons.delete, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
