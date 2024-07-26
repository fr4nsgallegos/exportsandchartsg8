import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Chart2Page extends StatefulWidget {
  @override
  State<Chart2Page> createState() => _Chart2PageState();
}

class _Chart2PageState extends State<Chart2Page> {
  Uint8List imagen = Uint8List(8);

  bool flag = false;

  GlobalKey globalKey = new GlobalKey();

  Future<Uint8List> captureWidget() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage();
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    imagen = pngBytes;
    return pngBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart2 Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("GRÁFICO 2"),
            Divider(),
            RepaintBoundary(
              key: globalKey,
              child: Container(
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
            ),
            ElevatedButton(
              onPressed: () async {
                imagen = await captureWidget();
                flag = true;
                setState(() {});
              },
              child: Text("TO PNG"),
            ),
            Divider(),
            flag
                ? Container(
                    width: 400,
                    height: 400,
                    child: Image.memory(
                      Uint8List.fromList(imagen),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
