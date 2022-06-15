import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filmler extends StatefulWidget {
  const Filmler({Key? key}) : super(key: key);

  @override
  State<Filmler> createState() => _FilmlerState();
}

class _FilmlerState extends State<Filmler> {
  var controllerFilm = TextEditingController();
  var controllerYonetmen = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
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
              border: OutlineInputBorder(),
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
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          FloatingActionButton(
            onPressed: () {
              final film = controllerFilm.text;
              final yonetmen = controllerYonetmen.text;
              createFilm(film: film, yonetmen: yonetmen);
              Navigator.pop(context);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future createFilm({required String film,required String yonetmen}) async {
    final docFilm = FirebaseFirestore.instance.collection('Films').doc();

    final films = Films(
      id: docFilm.id,
      film: film,
      yonetmen: yonetmen,
    );
    final json = films.toJson();

    await docFilm.set(json);
  }
}

class Films {
  String id;
  final String film;
  final String yonetmen;

  Films({
    this.id = '',
    required this.film,
    required this.yonetmen,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'film': film,
        'yonetmen': yonetmen,
      };

  static Films fromJson(Map<String, dynamic> json) =>
      Films(
          id: json['id'],
          film: json['film'],
          yonetmen: json['yonetmen']
      );

}
