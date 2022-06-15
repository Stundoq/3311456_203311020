import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ders_proje/screens/buton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  void signOutUser() async {
    await GoogleSignIn().disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Uygulamamızı beğendiniz mi?'),
                content: FittedBox(
                  child: Row(
                    children: [
                      TextButton(
                          child: Text('1'),
                          onPressed: () {
                            rateApp(oy: 1.toString());
                          }),
                      TextButton(
                          child: Text('2'),
                          onPressed: () {
                            rateApp(oy: 2.toString());
                          }),
                      TextButton(
                          child: Text('3'),
                          onPressed: () {
                            rateApp(oy: 3.toString());
                          }),
                      TextButton(
                          child: Text('4'),
                          onPressed: () {
                            rateApp(oy: 4.toString());
                          }),
                      TextButton(
                          child: Text('5'),
                          onPressed: () {
                            rateApp(oy: 5.toString());
                          }),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: Text('OK'),
                  ),
                ],
              ),
            ),
            icon: Icon(Icons.star),
            color: Colors.yellow,
            iconSize: 35,
          ),
          centerTitle: true,
          title: Text('ANA SAYFA'),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: FaIcon(
                FontAwesomeIcons.powerOff,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black54,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BenimButonum(metin: 'SAAT', iconum: Icons.watch_later),
                  BenimButonum(metin: 'EL FENERİ', iconum: Icons.highlight),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BenimButonum(metin: 'NOTLAR', iconum: Icons.event_note),
                  BenimButonum(metin: 'YAŞAM BEKLENTİSİ', iconum: Icons.photo),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BenimButonum(metin: 'HAVA DURUMU', iconum: Icons.sunny),
                  BenimButonum(metin: 'HAKKIMDA', iconum: Icons.person),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BenimButonum(metin: 'FİLMLER', iconum: Icons.movie),
                  BenimButonum(metin: 'OY GRAFİĞİ', iconum: Icons.pie_chart),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future rateApp({required String oy}) async {
    final docOy = FirebaseFirestore.instance
        .collection('Oylama')
        .doc(FirebaseAuth.instance.currentUser?.uid);
    final oylar = Rate(
      id: docOy.id,
      oy: oy,
    );
    final json = oylar.toJson();

    await docOy.set(json);
  }
}

class Rate {
  String id;
  String oy;

  Rate({
    this.id = '',
    required this.oy,
  });

  Map<String, dynamic> toJson() => {'id': id, 'oy': oy};

  static Rate fromJson(Map<String, dynamic> json) => Rate(
        id: json['id'],
        oy: json['oy'],
      );
}

Stream<List<Rate>> getRatings() => FirebaseFirestore.instance
    .collection('Oylama')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Rate.fromJson(doc.data())).toList());

class BenimButonum extends StatelessWidget {
  String metin;
  IconData iconum;

  BenimButonum({Key? key, required this.metin, required this.iconum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Buton(
            metin: metin,
            icon: Icon(iconum),
          ),
        ),
      ),
    );
  }
}
