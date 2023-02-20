import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart' ;
//import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pdf view.dart';
//import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Subject extends StatefulWidget {
  final produc;
  const Subject(this.produc, {Key? key}) : super(key: key);
  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:   Text('Details', textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
 boxShadow: [
                    BoxShadow(
                      color: Colors.grey, //New
                      blurRadius: 13.0,
                    )
                  ],
                ),
                child: IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon:Icon(Icons.arrow_back,color: const  Color.fromRGBO(220, 95, 0, 1)),)),
          ),),
        //  title: const Text('Tritan Bikes'),

        body:
        
        GridView.builder(
            itemCount:widget.produc.get('list').length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ), itemBuilder: (context,index){
return Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
      decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
            BoxShadow(
            color: Colors.grey, //New
            blurRadius: 13.0,
            )
            ],),
    child:   Padding(
      padding: const EdgeInsets.all(8.0),
      child:   Column(

        children: [

          Icon(Icons.picture_as_pdf_outlined,size: 90,color: const  Color.fromRGBO(220, 95, 0, 1)),
SizedBox(
  height: 20,
),
          InkWell(
              onTap: ()async{
final file=widget.produc.get('list')[index].toString();
Navigator.push(context, MaterialPageRoute(builder: (context)=>Pdf(file)));
        // PDFDocument.fromURL(widget.produc.get('list')[index].toString());
              //   PdfViewer.openFile( widget.produc.get('list')[index]);
                // if (!await launchUrl(Uri.parse( widget.produc.get('list')[index].toString()))) {
                //   throw 'Could not launch ';
                //   }
              },
              child: Text( widget.produc.get('list')[index].toString().substring(70,95),maxLines: 5,)),

        ],

      ),
    ),
  ),
);
        })
    //     Column(
    //       children: [
    //         for(var i=0;i<widget.produc.get('list').length;i++)...[
    //           ListTile(
    //             leading: Icon(Icons.picture_as_pdf_outlined) ,
    //             title: Text( widget.produc.get('list')[i].toString()),
    //             onTap: () async {
    //             //  PdfViewer.openFile( widget.produc.get('list')[i].toString().substring(70,96));
    // if (!await launchUrl(Uri.parse( widget.produc.get('list')[i].toString()))) {
    //   throw 'Could not launch ';
    //   }
    //             },
    //           )
    //           // IconButton(onPressed: () async {
    //           //
    //           //
    //           //
    //           //   if (!await launchUrl(Uri.parse( widget.produc.get('list')[i]))) {
    //           //   throw 'Could not launch ';
    //           //   }
    //           // }, icon: Icon(Icons.picture_as_pdf_outlined)),
    //         //  PdfViewer.openFile( widget.produc.get('list')[i].toString()),
    //         ],
    //       ],
    //     )


    );
  }
}
