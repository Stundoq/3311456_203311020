import 'package:flutter/material.dart';

class Notlar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "FİLM GÜNLÜĞÜ",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    "Günler",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Filmler",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "İzlendi/İzlenmedi",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                )
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      "Pazartesi",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "Interstellar",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "izlendi",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      "Salı",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "John Wick",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "İzlendi",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      "Çarşamba",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "Shawshank Redemption",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "İzlendi",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      "Perşembe",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "The Pianist",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "İzlenmedi",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      "Cuma",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "Harry Potter",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "İzlendi",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      "Cumartesi",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "Djengo",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "İzlenmedi",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      "Pazar",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "Fight Club",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                    DataCell(Text(
                      "İzlendi",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
