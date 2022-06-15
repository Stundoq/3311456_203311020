import 'package:flutter/material.dart';

import 'package:ders_proje/hava_durumu_homepage.dart';

void main() {
  runApp(const HavaDurumu());
}

class HavaDurumu extends StatelessWidget {
  const HavaDurumu({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
