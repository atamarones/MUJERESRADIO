import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constants.dart';

class BuildListVideo extends StatelessWidget {
  // Generate some dummy data
  final List dummyList = List.generate(10, (index) {
    return {
      "id": index,
      "title": "Programa #$index",
      "subtitle": "Publicado $index semana",
      "url": "https://www.youtube.com/watch?v=0QjDtEoxXjE"
    };
  });

  BuildListVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SafeArea(
            child: ListView.builder(
      itemCount: dummyList.length,
      itemBuilder: (context, index) => Card(
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: IconButton(
              icon: const Icon(Icons.play_circle),
              iconSize: 45.0,
              color: kPrimaryColor,
              onPressed: () => launchUrlString(dummyList[index]["url"])
          ),
          title: Text(dummyList[index]["title"]),
          subtitle: Text(dummyList[index]["subtitle"]),
          trailing: const Icon(Icons.favorite, color: Colors.red,),
        ),
      ),
    )));
  }
}
