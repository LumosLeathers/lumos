import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "can not launch url";
    }
  }

  Widget _button(String title, String url) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: OutlinedButton(
          onPressed: () async => await _launchURL(url),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            shape: const StadiumBorder(),
            backgroundColor: const Color.fromARGB(255, 21, 38, 66),
          ),
          child: Text(title, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget w = const Image(
      image: AssetImage('assets/logo.jpg'),
      width: 200,
      height: 200,
    );
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 38, 66),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                'LUMOS LEATHERS',
                style: TextStyle(
                    color: Color.fromARGB(255, 21, 38, 66),
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: w,

              /*Image(
                    image: AssetImage(
                  "assets/images/logo.jpg",
                )),*/

              /* Image.asset(
                  "assets/images/logo.jpg",
                  fit: BoxFit.cover,
                ),*/
            ),
            _button(
              "Instagram",
              'https://instagram.com/lumosleathers?igshid=OGQ5ZDc2ODk2ZA==',
            ),
            _button(
              "Facebook",
              'https://instagram.com/lumosleathers?igshid=OGQ5ZDc2ODk2ZA==',
            ),
            _button(
              "Website",
              'https://instagram.com/lumosleathers?igshid=OGQ5ZDc2ODk2ZA==',
            ),
            _button(
              "Phone Number",
              'tel:+96176509452',
            ),
          ],
        ),
      ),
    ));
  }
}
