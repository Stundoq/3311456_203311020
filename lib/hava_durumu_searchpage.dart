import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image/search.jpg'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: 'Şehir Seçiniz',
                  ),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () async {
                  var checkCity;
                  var response = await http.get(Uri.parse(
                      'https://api.openweathermap.org/data/2.5/weather?q=${myController.text}&units=metric&appid=098596c620ff6650efee0a2a734f307d'));
                  checkCity = jsonDecode(response.body)['cod'];
                  if(checkCity == '404'){
                    myController.text = 'Şehir Bulunamadı';
                    Navigator.pop(context, myController.text);
                  }else{
                    Navigator.pop(context, myController.text);
                  }
                },
                child: Text('Şehri Seç'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
