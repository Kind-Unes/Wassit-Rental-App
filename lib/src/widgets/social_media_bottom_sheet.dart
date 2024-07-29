import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaSheet extends StatelessWidget {
  const SocialMediaSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              launch(Uri.parse("https://wa.me/+9647744445973").toString());
            },
            icon: const Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.tealAccent,
            ),
          ),
          IconButton(
            onPressed: () {
              launch(Uri.parse(
                      "https://www.facebook.com/profile.php?id=61559019365010&mibextid=LQQJ4d")
                  .toString());
            },
            icon: const Icon(
              FontAwesomeIcons.facebook,
              color: Colors.tealAccent,
            ),
          ),
          IconButton(
            onPressed: () {
              launch(Uri.parse(
                      "https://www.tiktok.com/@appalatar?_t=8lz59LBeLLN&_r=1")
                  .toString());
            },
            icon: const Icon(
              FontAwesomeIcons.tiktok,
              color: Colors.tealAccent,
            ),
          ),
          IconButton(
            onPressed: () {
              launch(Uri.parse("https://snapchat.com/t/ltD5S46U").toString());
            },
            icon: const Icon(
              FontAwesomeIcons.snapchat,
              color: Colors.tealAccent,
            ),
          ),
          IconButton(
            onPressed: () {
              launch(Uri.parse(
                      "https://www.instagram.com/appalatar?igsh=Y2JsNWw5Nm03Z2p2&utm_source=qr")
                  .toString());
            },
            icon: const Icon(
              FontAwesomeIcons.instagram,
              color: Colors.tealAccent,
            ),
          ),
        ],
      ),
    );
  }
}
