import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum({int album = 1}) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/${album}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'userId': int userId,
      'id': int id,
      'title': String title,
      } =>
          Album(
            userId: userId,
            id: id,
            title: title,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreen();
}

class _GetScreen extends State<GetScreen> {
  late Future<Album> futureAlbum;
  int currentIdAlbum = 1;
  bool isLoader = false;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(album: this.currentIdAlbum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  isLoader =
                      snapshot.connectionState == ConnectionState.waiting;
                  if (snapshot.hasData) {
                    return Text('${currentIdAlbum}: ${snapshot.data!.title}');
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isLoader) {
                        return;
                      }
                      setState(() {
                        int id = currentIdAlbum + 1;
                        currentIdAlbum = id;
                        futureAlbum = fetchAlbum(album: id);
                      });
                    },
                    child: const Text('id++'),
                  ))
            ],
          )),
    );
  }
}