import 'package:ders_proje/alarm.dart';
import 'package:ders_proje/fotograflar.dart';
import 'package:ders_proje/saat.dart';
import 'package:ders_proje/takvim.dart';
import 'package:ders_proje/yasam_beklentisi.dart';
import 'package:flutter/material.dart';
import 'el_feneri.dart';
import 'hakkimda.dart';
import 'kronometre.dart';
import 'notlar.dart';

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
        }else if (metin == 'ALARM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Alarm()),
          );
        }else if (metin == 'YAŞAM BEKLENTİSİ') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => YasamBeklentisi()),
          );
        }
      },
    );
  }
}
