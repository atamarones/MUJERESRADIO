import 'package:flutter/material.dart';
import 'package:prueba_auth/screens/home_screen/body.dart';
import 'package:prueba_auth/screens/home_screen/home_screen.dart';

class MyAppBarTransparent extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAppBarTransparent({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 90,
        centerTitle: true,
        leading: BackButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Body()),
          );
        })) ;
  }
}
