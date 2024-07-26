import 'dart:math';

import 'package:exportsandchartsg8/models/data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart1Page extends StatelessWidget {
  List<DataModel> lista = [];

  List<DataModel> _generateData(int max) {
    final random = new Random();
    return List.generate(
        31,
        (index) => DataModel(
            date: DateTime(2024, 1, index + 1),
            valor: random.nextDouble() * max));
  }

  Widget _graph() {
    final spots = _generateData(200)
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.valor))
        .toList();
    // spots.forEach((elemet) {
    //   print(elemet);
    // });

    // print(spots.length);
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            dotData: FlDotData(show: false),
            color: Colors.red,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Char1 Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _graph();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("GRÁFICO 1 "),
          Divider(),
          Container(
            height: 300,
            child: _graph(),
          )
        ],
      ),
    );
  }
}
