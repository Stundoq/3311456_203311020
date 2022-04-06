import 'package:ders_proje/yasam_beklentisi.dart';
import 'package:flutter/material.dart';

class SonucSayfasi extends StatelessWidget {
  const SonucSayfasi({Key? key}) : super(key: key);

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
              child: Text('Beklenen yaşam süresi: '),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YasamBeklentisi()),);
              },
              child: Text('Geri Dön'),
            ),
          )
        ],
      ),
    );
  }
}
