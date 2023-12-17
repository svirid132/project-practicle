import 'package:fetch/screens/get.dart';
import 'package:fetch/screens/post.dart';
import 'package:flutter/material.dart';

void main() => runApp(const TabBarDemo());

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'get'),
                Tab(text: 'post'),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Fetch Data Example'),
          ),
          body: const TabBarView(
            children: [
              GetScreen(),
              PostScreen(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}