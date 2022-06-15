import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ders_proje/hava_durumu_searchpage.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sehir = 'Ankara';
  double? temperature;
  int? temperatureInt;
  var locationData;

  Future<void> getTemperatureData() async {
    var locationTemp = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$sehir&units=metric&appid=098596c620ff6650efee0a2a734f307d'),
    );

    var temperatureDataParsed = jsonDecode(locationTemp.body);
    setState(() {
      temperature = temperatureDataParsed['main']['temp'];
    });

    temperatureInt = temperature?.round();
  }

  Future<void> getLocationData() async {
    var locationData = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$sehir&units=metric&appid=098596c620ff6650efee0a2a734f307d'),
    );

    var locationDataParsed = jsonDecode(locationData.body);

    setState(() {
      sehir = locationDataParsed['name'];
    });

  }

  void getDataFromAPI() async {
    await getLocationData();
    getTemperatureData();
  }

  @override
  void initState() {
    getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image/lc.jpg'),
        ),
      ),
      child: temperatureInt == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$temperatureInt° C',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$sehir',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      sehir = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage()),
                      );
                      getDataFromAPI();
                      setState(() {
                        sehir = sehir;
                      });
                    },
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
