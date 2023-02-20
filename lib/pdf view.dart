import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class Pdf extends StatefulWidget {
  final file;
  const Pdf(this.file, {Key? key}) : super(key: key);


  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.file.toString().substring(70,95),maxLines: 1,),
      ),
      body: PDFView(
        filePath: widget.file,
      ),
    );
  }
}
