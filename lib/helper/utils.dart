import 'package:url_launcher/url_launcher_string.dart';

class Utils {
  static Future openLink({
    required String url,
  }) =>
      _launchUrl(url);

  static Future openEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    await _launchUrl(url);
  }

  static Future openPhoneCall({required String phoneNumber}) async {
    final url = 'tel:$phoneNumber';

    await _launchUrl(url);
  }

  static Future openSMS({required String phoneNumber}) async {
    final url = 'sms:$phoneNumber';

    await _launchUrl(url);
  }

  static Future _launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }

  static Future openWhatsapp() async {
    const url = "https://wa.me/?text=Your Message here";
    var encoded = Uri.encodeFull(url);
    // android , web
    if (await canLaunchUrlString(encoded)) {
      await launchUrlString(encoded);
    } else {
      throw ("whatsapp no installed");
    }
  }
}
