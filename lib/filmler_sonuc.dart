import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ders_proje/film_guncelle.dart';
import 'package:ders_proje/screens/filmler.dart';
import 'package:flutter/material.dart';

class FilmlerSonuc extends StatefulWidget {
  const FilmlerSonuc({Key? key}) : super(key: key);

  @override
  State<FilmlerSonuc> createState() => _FilmlerSonucState();
}

class _FilmlerSonucState extends State<FilmlerSonuc> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Filmler()),
                    );
                  },
                  icon: Icon(Icons.add))
            ],
            centerTitle: true,
            title: Text("Filmler"),
          ),
          body: StreamBuilder<List<Films>>(
            stream: readFilms(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong! : ${snapshot.error}");
              } else if (snapshot.hasData) {
                final books = snapshot.data!;
                return ListView(children: books.map(buildFilms).toList());
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }

  Widget buildFilms(Films films) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilmGuncelle(films: films,)),
          );
        },
        onLongPress: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Sil'),
            content: const Text('Veriyi silmek istediğinize emin misiniz?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('Films')
                      .doc(films.id)
                      .delete();
                  return Navigator.pop(context, 'OK');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: ListTile(
          title: Text(films.film),
          subtitle: Text(films.yonetmen),
        ),
      );

  Stream<List<Films>> readFilms() => FirebaseFirestore.instance
      .collection("Films")
      .snapshots()
      .map((snapshots) =>
          snapshots.docs.map((doc) => Films.fromJson(doc.data())).toList());
}
