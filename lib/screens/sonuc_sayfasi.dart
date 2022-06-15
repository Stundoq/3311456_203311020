import 'package:ders_proje/screens/yasam_beklentisi.dart';
import 'package:flutter/material.dart';

class SonucSayfasi extends StatelessWidget {
  String seciliCinsiyet;
  double icilenSigara;
  double sporGunu;
  int boy;
  int kilo;

  SonucSayfasi(
      {Key? key,
      required this.seciliCinsiyet,
      required this.icilenSigara,
      required this.sporGunu,
      required this.boy,
      required this.kilo})
      : super(key: key);

  String yasamHesap(String _cinsiyet,double _sigara, double _spor,int boy, int kilo){
    double dboy= (boy/100);
    double BMI = kilo/(dboy*dboy);
    return BMI.toStringAsPrecision(4);


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuç Sayfası'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text('Beklenen yaşam süresi: ${yasamHesap(seciliCinsiyet, icilenSigara, sporGunu, boy, kilo)}'),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YasamBeklentisi()),
                );
              },
              child: Text('Geri Dön'),
            ),
          )
        ],
      ),
    );
  }
}
