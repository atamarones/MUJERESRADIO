import 'package:flutter/material.dart';
import '../../../constants.dart';

class MyAppBarHomeWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAppBarHomeWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text('Mujeres Radio', style: kTitleTextStyle),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 90,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.black87],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        actions: <Widget>[
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(logoMain),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ]);
  }
}
