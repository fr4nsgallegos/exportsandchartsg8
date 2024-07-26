import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;

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
    sheet.getRangeByName('A1').setText("Hola que tal");
    sheet.getRangeByIndex(2, 1).setText("este es el A2");

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
            ],
          ),
        ),
      ),
    );
  }
}