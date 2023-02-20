import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdverDetails extends StatefulWidget {
  final product;
  const AdverDetails(this.product, {Key? key}) : super(key: key);
  @override
  State<AdverDetails> createState() => _AdverDetailsState();
}
class _AdverDetailsState extends State<AdverDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Stack(
                children:[
                  Padding(
                    padding: const EdgeInsets.only(top: 15,),
                    child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),),
                      child: Image.network(widget.product.get('image'))),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Padding(
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
                    ),
                  ),]
              ),
            ),
           SizedBox(
             height: 20,
           ),
           Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(
                 topRight: Radius.circular(20),
                 topLeft: Radius.circular(20),
               ),
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey, //New
                   blurRadius: 13.0,
                 )
               ],
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   Text(widget.product.get('title'),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                   SizedBox(
                     height: 20,
                   ),
                   Table(
                       columnWidths: {
                         0: FlexColumnWidth(5),
                         1: FlexColumnWidth(2),
                         //  2: FlexColumnWidth(4),
                       },
                       children: [
                         TableRow(
                             children: [
                               Text('',),
                               InkWell(
                                 onTap: ()async{
    if (!await launchUrl(Uri.parse( widget.product.get('url')))) {
     throw 'Could not launch ';
      }
    },
                                 child: Row(
                                   children: [
                                     Icon(Icons.webhook_sharp,color: Colors.blue,),
                                     Text(' Link',style: TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Color.fromRGBO(220, 95, 0, 1)),),
                                   ],
                                 ),
                               )
                             ]
                         ),
                       ]
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Text(widget.product.get('details'),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
SizedBox(
  height: 200,
)
                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
