import 'package:flutter/material.dart';

class Hakkimda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Hakkımda"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage('assets/pcmr.jpg'),
                ),
                SizedBox(
                  height: 15,
                ),
                containerCards(
                  color: Colors.blue,
                  icon: Icons.person,
                  text: "Eren Üstündağ",
                ),
                SizedBox(
                  height: 10,
                ),
                containerCards(
                  color: Colors.blue,
                  icon: Icons.mail,
                  text: "erenustundagg@gmail.com",
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 5),
                  ),
                  margin: EdgeInsets.all(12),
                  child: Text(
                    "Adım eren selçukta okuyorum.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class containerCards extends StatelessWidget {
  Color? color;
  IconData? icon;
  String text;
  Widget? child;
  containerCards({this.color, this.icon, required this.text, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45.0),
      padding: EdgeInsets.all(12),
      color: color,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
