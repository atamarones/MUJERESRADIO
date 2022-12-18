import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constants.dart';

class StaticImage extends StatelessWidget {
  const StaticImage({
    Key? key,
    required this.call_to_action,
    required this.url_image,
    required this.height,
  }) : super(key: key);

  final String call_to_action;
  final String url_image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => launchUrlString(call_to_action),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(blog),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}