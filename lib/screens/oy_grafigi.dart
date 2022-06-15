import 'package:ders_proje/screens/ana_sayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OyGrafigi extends StatefulWidget {
  const OyGrafigi({Key? key}) : super(key: key);

  @override
  State<OyGrafigi> createState() => _OyGrafigiState();
}

class _OyGrafigiState extends State<OyGrafigi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oy Grafiği'),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder<List<Rate>>(
          stream: getRatings(),
          builder: (context, snapshot) {
            int oybir = 0;
            int oyiki = 0;
            int oyuc = 0;
            int oydort = 0;
            int oybes = 0;
            if (snapshot.hasData) {
              final oylar = snapshot.data!;
              for (int i = 0; i < oylar.length; i++) {
                switch (int.parse(oylar[i].oy)) {
                  case 1:
                    {
                      oybir++;
                    }
                    break;
                  case 2:
                    {
                      oyiki++;
                    }
                    break;
                  case 3:
                    {
                      oyuc++;
                    }
                    break;
                  case 4:
                    {
                      oydort++;
                    }
                    break;
                  case 5:
                    {
                      oybes++;
                    }
                    break;
                }
              }
             int oytoplamlar = oybir+oyiki+oyuc+oydort+oydort;
              List<PieChartSectionData> OyListesi = [
                PieChartSectionData(radius: oybir*205/oytoplamlar,
                    color: Colors.red,
                    title: '1',
                    value: double.tryParse(oybir.toString())),
                PieChartSectionData(radius: oyiki*205/oytoplamlar,
                    color: Colors.orange,
                    title: '2',
                    value: double.tryParse(oyiki.toString())),
                PieChartSectionData(radius: oyuc*205/oytoplamlar,
                    color: Colors.yellow,
                    title: '3',
                    value: double.tryParse(oyuc.toString())),
                PieChartSectionData(radius: oydort*205/oytoplamlar,
                    color: Colors.blue,
                    title: '4',
                    value: double.tryParse(oydort.toString())),
                PieChartSectionData( radius: oybes*205/oytoplamlar,
                    color: Colors.green,
                    title: '5',
                    value: double.tryParse(oybes.toString()))
              ];
              return PieChart(
                  PieChartData(sections: OyListesi));
            } else
              return Text(snapshot.error.toString());
          },
        ),
      ),
    );
  }
}
