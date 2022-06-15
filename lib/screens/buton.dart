import 'package:ders_proje/filmler_sonuc.dart';
import 'package:ders_proje/screens/oy_grafigi.dart';
import 'package:ders_proje/screens/yasam_beklentisi.dart';
import 'package:flutter/material.dart';
import 'package:ders_proje/screens/alarm.dart';
import 'package:ders_proje/screens/hava_durumu.dart';
import 'package:ders_proje/screens/kronometre.dart';
import 'package:ders_proje/screens/saat.dart';
import 'package:ders_proje/screens/takvim.dart';
import 'package:ders_proje/screens/el_feneri.dart';
import 'package:ders_proje/screens/hakkimda.dart';
import 'package:ders_proje/screens/notlar.dart';

class Buton extends StatelessWidget {
  Widget icon;
  String metin;

  Buton({required this.metin, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      icon: icon,
      label: Text(metin),
      onPressed: () {
        if (metin == 'SAAT') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Saat()),
          );
        } else if (metin == 'TAKVİM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Takvim()),
          );
        } else if (metin == 'EL FENERİ') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ElFeneri()),
          );
        } else if (metin == 'KRONOMETRE') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Kronometre()),
          );
        } else if (metin == 'NOTLAR') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Notlar()),
          );
        } else if (metin == 'HAKKIMDA') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Hakkimda()),
          );
        } else if (metin == 'ALARM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Alarm()),
          );
        } else if (metin == 'HAVA DURUMU') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HavaDurumu()),
          );
        } else if (metin == 'YAŞAM BEKLENTİSİ') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => YasamBeklentisi()),
          );
        } else if (metin == 'FİLMLER') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilmlerSonuc()),
          );
        }else if (metin == 'OY GRAFİĞİ') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OyGrafigi()),
          );
        }
      },
    );
  }
}
