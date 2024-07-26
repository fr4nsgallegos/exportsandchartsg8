import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exportsandchartsg8/charts/chart1_page.dart';
import 'package:exportsandchartsg8/charts/chart2_page.dart';
import 'package:exportsandchartsg8/pages/cart_page.dart';
import 'package:exportsandchartsg8/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
import 'package:syncfusion_officechart/officechart.dart';

class HomePage extends StatelessWidget {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("candidates");

  Future exportPDF() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Column(
              children: [
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
                pw.Text("Hola"),
              ],
            )
          ];
        },
      ),
    );
    Uint8List bytes = await pdf.save();
    print(bytes);

    Directory directory = await getApplicationSupportDirectory();
    print(directory);

    String filename = "${directory.path}/reportPDF.pdf";
    print(filename);

    File pdfFile = File(filename);
    await pdfFile.writeAsBytes(bytes, flush: true);

    OpenFile.open(filename);
  }

  Future exportExcel() async {
    final workbook = excel.Workbook();
    final excel.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText("Partido Político");
    sheet.getRangeByIndex(1, 2).setText("Representante");
    sheet.getRangeByIndex(1, 3).setText("N votos");
    int row = 2;

    QuerySnapshot candidateCollection = await candidateReference.get();

    List<QueryDocumentSnapshot> docs = candidateCollection.docs;

    List.generate(docs.length, (index) {
      sheet.getRangeByIndex(row, 1).setText(docs[index]["nombrePartido"]);
      sheet.getRangeByIndex(row, 2).setText(docs[index]["representante"]);
      sheet.getRangeByIndex(row, 3).setText(docs[index]["nVotos"].toString());
      row++;
    });
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final String path = (await getApplicationSupportDirectory()).path;
    final String filename = "$path/myFirstExcel.xlsx";

    // print(path);
    // print(filename);
    final File file = File(filename);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(filename);
  }

  Future exportExcelChart() async {
    final excel.Workbook workbook = excel.Workbook();
    final excel.Worksheet sheet1 = workbook.worksheets.addWithName("Chart");

    sheet1.enableSheetCalculations();
    sheet1.getRangeByName("A1").setText("Partido Político");
    sheet1.getRangeByIndex(1, 2).setText("Representante");
    sheet1.getRangeByIndex(1, 3).setText("N votos");

    sheet1.getRangeByIndex(1, 1).columnWidth = 20;
    sheet1.getRangeByIndex(1, 2).columnWidth = 15;

    sheet1.getRangeByName("A1:A18").rowHeight = 22;

    //agregando estilos
    final excel.Style style1 = workbook.styles.add("Style1");
    style1.backColor = '#0078D4';
    style1.vAlign = excel.VAlignType.center;
    style1.hAlign = excel.HAlignType.center;
    style1.bold = true;

    sheet1.getRangeByName("A1:C1").cellStyle = style1;

    QuerySnapshot candidateCollection = await candidateReference.get();

    List<QueryDocumentSnapshot> docs = candidateCollection.docs;
    int row = 2;
    List.generate(docs.length, (index) {
      sheet1.getRangeByIndex(row, 1).setText(docs[index]["nombrePartido"]);
      sheet1.getRangeByIndex(row, 2).setText(docs[index]["representante"]);
      sheet1
          .getRangeByIndex(row, 3)
          .setNumber(docs[index]["nVotos"].toDouble());
      row++;
    });

    sheet1.getRangeByIndex(row, 2).setText("total");
    sheet1.getRangeByIndex(row, 3).setFormula("=SUM(C2:C4)");

    final ChartCollection chartCollection = ChartCollection(sheet1);

    final Chart chart = chartCollection.add();
    chart.chartType = ExcelChartType.pie;
    chart.dataRange = sheet1.getRangeByName('B1:C4');
    chart.chartTitle = "RESUMEN DE VOTOS";
    sheet1.charts = chartCollection;

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final String path = (await getApplicationSupportDirectory()).path;
    final String filename = "$path/myFirstExcel.xlsx";

    // print(path);
    // print(filename);
    final File file = File(filename);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(filename);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  exportPDF();
                },
                child: Text("PDF"),
              ),
              ElevatedButton(
                onPressed: () {
                  exportExcel();
                },
                child: Text("EXCEL"),
              ),
              ElevatedButton(
                onPressed: () async {
                  QuerySnapshot candidateCollection =
                      await candidateReference.get();
                  print(candidateCollection.docs);
                },
                child: Text("firestore"),
              ),
              ElevatedButton(
                onPressed: () async {
                  exportExcelChart();
                },
                child: Text("excel with chart"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go("/profile");
                },
                child: Text("go profile"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("go cart"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chart1Page(),
                    ),
                  );
                },
                child: Text("CHART 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chart2Page(),
                    ),
                  );
                },
                child: Text("CHART 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
