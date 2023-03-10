import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'list_view_video.dart';

class Body extends StatelessWidget {
  final double coverHeight = 220;
  final double profileHeight = 85;

  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          toolbarHeight: 40.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(''),
          centerTitle: true,
          flexibleSpace: Container(
            height: 70.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.black87, kPrimaryColor]),
            ),
          ),
        ),
        body: Column(
          //padding: EdgeInsets.zero,
          children: <Widget>[
            _buidTop(),
            _buildContent(),
            const SizedBox(height: 8),
            const Divider(),
            BuildListVideo(),
          ],
        ));
  }

  Widget _buidTop() {
    final double bottom = profileHeight / 2;
    final double top = coverHeight - (profileHeight / 2);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: bottom),
          child: _buidCoverImage(),
        ),
        Positioned(top: top, child: _buidProfileImage())
      ],
    );
  }

  Widget _buidCoverImage() {
    return Container(
        color: Colors.white,
        width: double.infinity,
        height: coverHeight,
        child: CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: Get.arguments['image'],
            fit: BoxFit.cover));
  }

  Widget _buidProfileImage() {
    return CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage:
            const AssetImage("assets/images/mujeres-radio-logo.png"));
  }

  Widget _buildContent() => Column(
        children: [
          //    const SizedBox(height: 8),
          //    Text(Get.arguments['nameLocutora'], style: kTitleBlackStyle),
          const SizedBox(height: 5),
          //    Text(Get.arguments['namePrograma'], style: kTextBlackStyle),
          //    const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buidSocialIcon(FontAwesomeIcons.facebookF),
              const SizedBox(width: 10),
              _buidSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(width: 10),
              _buidSocialIcon(FontAwesomeIcons.youtube),
              const SizedBox(width: 10),
              _buidSocialIcon(FontAwesomeIcons.instagram)
            ],
          ),
        ],
      );

  Widget _buidSocialIcon(IconData icon) => CircleAvatar(
        radius: 20,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
                child: Icon(
              icon,
              size: 20,
            )),
          ),
        ),
      );
}
