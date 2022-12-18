import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginButton extends StatelessWidget {
  final String text;
  //final String imagePath;
  final VoidCallback? onTap;
  final Color color;
  final Color textColor;
  final String icon;

  const LoginButton({
    Key? key,
    required this.text,
    //required this.imagePath,
    // ignore: unused_element
    this.onTap,
    // ignore: unused_element
    this.color = Colors.blue,
    // ignore: unused_element
    this.textColor = Colors.white,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 3,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(
                width: 10,
                height: 40,
              ),
              Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
