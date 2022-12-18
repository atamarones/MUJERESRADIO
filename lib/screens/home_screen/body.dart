import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/my_user_controller.dart';
import '../../components/size_config.dart';
import 'components/appbar.dart';
import 'components/botton_navigation_bar.dart';
import 'components/drawer.dart';
import 'home_content_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final userController = Get.put(MyUserController());
    SizeConfig().init(context);
    return Scaffold(
      appBar: const MyAppBarHomeWidget(),
      bottomNavigationBar: MyBottomNavigationBar(),
      drawer: const NavigationDrawerWidget(),
      body: const MyHomeContent(),
    );
  }
}
