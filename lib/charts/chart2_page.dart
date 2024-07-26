import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart2 Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("GRÁFICO 2"),
          Divider(),
          Container(
            height: 300,
            child: BarChart(
              BarChartData(
                barGroups: [
                  BarChartGroupData(
                    x: 1,
                    barsSpace: 20,
                    groupVertically: false,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 15,
                        color: Colors.red,
                        width: 20,
                      ),
                      BarChartRodData(
                        toY: 50,
                        fromY: 0,
                        color: Colors.cyan,
                        width: 10,
                      ),
                      BarChartRodData(
                        toY: 70,
                        fromY: 0,
                        color: Colors.orange,
                        width: 10,
                      ),
                      BarChartRodData(
                        toY: 20,
                        fromY: 0,
                        color: Colors.black,
                        width: 10,
                      ),
                      BarChartRodData(
                        toY: 30,
                        fromY: 0,
                        color: Colors.yellow,
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
