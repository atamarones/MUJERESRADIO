import 'package:flutter/material.dart';

import 'components/size_config.dart';

// Colors
const kTextColor = Color(0xFFFFFFFF);
const kBlueColor = Color(0xFF6E8AFA);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);
const kBlackColor = Color(0x00000000);
//Colors
// ignore: constant_identifier_names
const background_color = Color.fromRGBO(99, 45, 142, 1);

// My Text Styles
const kHeadingextStyle = TextStyle(
  fontSize: 28,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
const kSubheadingextStyle = TextStyle(
  fontSize: 24,
  color: Color(0xFF61688B),
  height: 2,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20,
  color: kTextColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Muli',
);

const kTextBlackStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  fontFamily: 'Muli',
);

const kTitleBlackStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  fontFamily: 'Muli',
);

const kSubtitleTextSyule = TextStyle(
  fontSize: 18,
  color: kTextColor,
  // fontWeight: FontWeight.bold,
);

/// Ecommerce Styles////
const kPrimaryColor = Color.fromRGBO(99, 45, 142, 1);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
//const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

//images
const albumart = "assets/images/AlbumArt.jpg";
const button = "assets/images/button.png";
const disk = "assets/images/disk.png";
const logoMain = "assets/images/mujeres-radio-logo.png";
const logoMorado = "assets/images/logo_final.png";
const blog = "assets/images/blog.jpg";

//Images Carousel
const cursoLoc = "assets/images/1.png";
const produccionRadio = "assets/images/2.png";
const locutora = "assets/images/3.png";
const publiradio = "assets/images/4.png";

