import 'package:flutter/material.dart';
import 'package:ders_proje/buton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          centerTitle: true,
          title: Text('ANA SAYFA'),
        ),
        backgroundColor: Colors.black54,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Buton(
                        metin: 'SAAT',
                        icon: Icon(Icons.watch_later),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Buton(
                        metin: 'TAKVİM',
                        icon: Icon(Icons.date_range_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Buton(
                        metin: 'EL FENERİ',
                        icon: Icon(Icons.highlight),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Buton(
                        metin: 'KRONOMETRE',
                        icon: Icon(Icons.timer),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Buton(
                        metin: 'NOTLAR',
                        icon: Icon(Icons.event_note),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Buton(
                        metin: 'ALARM',
                        icon: Icon(Icons.ring_volume),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Buton(
                        metin: 'YAŞAM BEKLENTİSİ',
                        icon: Icon(Icons.photo),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Buton(
                        metin: 'HAKKIMDA',
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
