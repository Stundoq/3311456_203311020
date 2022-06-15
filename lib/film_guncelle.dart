import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ders_proje/screens/filmler.dart';

class FilmGuncelle extends StatefulWidget {
  Films films;

  FilmGuncelle({Key? key, required this.films}) : super(key: key);

  @override
  State<FilmGuncelle> createState() => _FilmGuncelleState();
}

class _FilmGuncelleState extends State<FilmGuncelle> {
  @override
  Widget build(BuildContext context) {
    final controllerFilm = TextEditingController();
    final controllerYonetmen = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Filmler'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: controllerFilm,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              labelText: 'Film Adı',
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: controllerYonetmen,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              labelText: 'Yönetmen',
            ),
          ),
          SizedBox(
            height: 24,
          ),
          FloatingActionButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('Films')
                  .doc(widget.films.id)
                  .update({
                'film': controllerFilm.text,
                'id': widget.films.id,
                'yonetmen': controllerYonetmen.text
              });
              Navigator.pop(context);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
