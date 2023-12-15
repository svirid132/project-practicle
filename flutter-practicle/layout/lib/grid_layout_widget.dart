
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.grey),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.5,
          children: List.generate(10, (index) {
            return Container(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('one'),
                  Text('one'),
                  Text('one'),
                  Text('one'),
                  Text('one'),
                  Text('one'),
                ],
              ),
            );
          }
          ),
        )
    );
  }
}
