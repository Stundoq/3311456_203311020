import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ElFeneri extends StatefulWidget {
  const ElFeneri({Key? key}) : super(key: key);

  @override
  State<ElFeneri> createState() => _ElFeneriState();
}

class _ElFeneriState extends State<ElFeneri> {
  Color? fenerRengi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('El Feneri'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.highlight, size: 400,color: fenerRengi,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      fenerRengi = Colors.white;
                    });
                  },
                  backgroundColor: Colors.black54,
                  child: FaIcon(Icons.circle,color: Colors.green,)
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      fenerRengi = Colors.black;
                    });
                  },
                  backgroundColor: Colors.black54,
                  child: FaIcon(Icons.circle,color: Colors.red,)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
