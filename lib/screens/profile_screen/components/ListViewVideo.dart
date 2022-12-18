import 'package:flutter/material.dart';

class buildListVideo extends StatelessWidget {
  const buildListVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
      children: const [
        ListTile(
          title: Text("Video 1"),
        ),
        ListTile(
          title: Text("Video 2"),
        ),
        ListTile(
          title: Text("Video 2"),
        ),
        ListTile(
          title: Text("Video 2"),
        ),
      ],
      ));
  }
}
