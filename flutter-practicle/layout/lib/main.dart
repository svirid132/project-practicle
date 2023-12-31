import 'package:flutter/material.dart';
import 'package:layout/container_layout_widget.dart';
import 'package:layout/grid_layout_widget.dart';
import 'package:layout/center_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ContainerLayout(),
      // home: GridLayout()
      home: Container(
          decoration: const BoxDecoration(color: Colors.grey),
          child: CenterWidget()
      )
    );
  }
}