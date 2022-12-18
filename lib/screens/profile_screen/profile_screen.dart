import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/size_config.dart';
import 'components/profile_body_screen.dart';

class ProfileScreen extends StatelessWidget {
   const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
