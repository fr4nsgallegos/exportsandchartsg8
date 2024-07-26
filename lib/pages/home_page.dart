import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomePage extends StatelessWidget {
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

  exportExcel() {}

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
            ],
          ),
        ),
      ),
    );
  }
}
