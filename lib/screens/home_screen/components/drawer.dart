import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../app.dart';
import '../../../constants.dart';
import '../../../controllers/auth_controller.dart';
import '../../../helper/utils.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0);

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: background_color,
        child: ListView(
          padding: padding,
          children: <Widget>[
            Container(
                height: 114,
                color: Colors.white,
                padding: const EdgeInsets.only(top: 10),
                child: _buildDrawerHeader(context)),
            const Text("  Social Media",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            buildMenuItem(
                text: 'Facebook',
                icon: FontAwesomeIcons.facebook,
                onClicked: () => Utils.openLink(
                    url: 'https://www.facebook.com/mujeresradionet/')),
            buildMenuItem(
                text: 'Instagram',
                icon: FontAwesomeIcons.instagram,
                onClicked: () => Utils.openLink(
                    url: 'https://www.instagram.com/mujeresradionet/')),
            buildMenuItem(
                text: 'Youtube',
                icon: FontAwesomeIcons.youtube,
                onClicked: () => Utils.openLink(
                    url:
                        'https://www.youtube.com/channel/UCjCiV0FJxYLhrIMbKVpxf6w')),
            buildMenuItem(
                text: 'Twitter',
                icon: FontAwesomeIcons.twitter,
                onClicked: () =>
                    Utils.openLink(url: 'https://twitter.com/mujeresradio')),
            const Divider(color: Colors.white70),
            const Text("  Contáctanos",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            buildMenuItem(
                text: 'Whatsapp',
                icon: FontAwesomeIcons.whatsapp,
                onClicked: () => Utils.openLink(
                    url: 'https://chat.whatsapp.com/L1VxSAolGmCAbpGTPr7QdO8')),
            buildMenuItem(
                text: 'Nuestra Web',
                icon: Icons.laptop_chromebook_rounded,
                onClicked: () =>
                    Utils.openLink(url: 'http://mujeresradio.net/')),
            buildMenuItem(
                text: 'Salir',
                icon: Icons.logout,
                onClicked: () => Get.find<AuthController>().signOut()),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text,
          style: (const TextStyle(
              color: color, fontSize: 14, fontWeight: FontWeight.w700))),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyApp()));
        break;
    }
  }

  UserAccountsDrawerHeader _buildDrawerHeader(BuildContext context) {
    return const UserAccountsDrawerHeader(
      accountName: Text('', style: TextStyle(backgroundColor: Colors.white)),
      accountEmail: Text('', style: TextStyle(backgroundColor: Colors.black)),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/logo_final.png"))),
    );
  }
}
