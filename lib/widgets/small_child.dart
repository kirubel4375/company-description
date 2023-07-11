import 'package:company_description/controllers/scroll_cont.dart';
import 'package:company_description/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'contact.dart';

class SmallChild extends StatefulWidget {
  const SmallChild({super.key});

  @override
  State<SmallChild> createState() => _SmallChildState();
}

class _SmallChildState extends State<SmallChild> {

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _createAnEmail(String email) async {
    final Uri launchUri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }
  Future<void> _openLink(String url) async {
    final Uri launchUri = Uri(scheme: 'https', path: url);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: context.watch<Cont>().controller,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ShaderMask(
              shaderCallback: (bounds) => RadialGradient(
              radius: 9.0,
              center: Alignment.topCenter,
              colors: [
                Colors.red,
                Colors.blue.shade900,
                Colors.yellow,
              ],
            ).createShader(bounds),
              child: const Text(
                "Hello!",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat-Regular"),
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) => RadialGradient(
              radius: 9.0,
              center: Alignment.topCenter,
              colors: [
                Colors.red,
                Colors.blue.shade900,
                Colors.yellow,
              ],
            ).createShader(bounds),
              child: RichText(
                text: const TextSpan(
                  text: 'WellCome To ',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Splendor Business Solutions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white)),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(
                "Do you want feasibility study?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 5.0),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(
                "Services we provide",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 31.0, top: 15),
              child: Text(
                "\u2022 Feasibility study",
                style: TextStyle(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 31.0, top: 15),
              child: Text("\u2022 Business plan"),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 31.0, top: 15),
              child: Text("\u2022 Marketing strategies"),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 31.0, top: 15),
              child: Text("\u2022 Business consultation"),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 31.0, top: 15),
              child: Text("\u2022 Organizational restructuring"),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                "assets/images/a_logo.png",
                scale: 1,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Search(),
            const SizedBox(height: 30),
            const AboutPage(),
            const SizedBox(height: 30),
            const ContactPage(),
            const SizedBox(height: 30),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Follow Us on",
                  style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 19.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Telegram:"),
                    TextButton(
                      onPressed: () async{
                        await _openLink('t.me/splendorbusiness');
                      },
                      child: const Text("t.me/splendorbusiness"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Instagram:"),
                    TextButton(
                      onPressed: () async{
                        await _openLink('https://instagram.com/splendorbusiness?igshid=NGExMmI2YTkyZg==');
                      },
                      child: const Text(" link here"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Facebook:"),
                    TextButton(
                      onPressed: () async{await _openLink('https://www.facebook.com/profile.php?id=100094227276658');},
                      child: const Text("link here"),
                    ),
                  ],
                ),
                const SizedBox(height: 23.5),
                const Text(
                  "Reach Us",
                  style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 19.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: Wrap(
                    children: [
                      const Text("Phone:"),
                      TextButton(
                        onPressed: () async {
                          await _makePhoneCall('0942747078');
                        },
                        child: const Text("+251942747078"),
                      ),
                      const Text("/"),
                      TextButton(
                        onPressed: () async {
                          await _makePhoneCall('0948211543');
                        },
                        child: const Text("+251948211543"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.5),
                Center(
                  child: Wrap(
                    children: [
                      const Text("Email:"),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () async {
                              await _createAnEmail(
                                  "splendorbusiness05@gmail.com");
                            },
                            child: const Text("splendorbusiness05@gmail.com"),
                          ),
                          TextButton(
                            onPressed: () async {
                              await _createAnEmail("ajfiraol5@gmail.com");
                            },
                            child: const Text("ajfiraol5@gmail.com"),
                          ),
                          TextButton(
                            onPressed: () async {
                              await _createAnEmail("kirubel4375@gmail.com");
                            },
                            child: const Text("kirubel4375@gmail.com"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
