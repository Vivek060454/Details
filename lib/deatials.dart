import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htttp/modelm.dart';

class Deatails extends StatefulWidget {
final userdetails;
  const Deatails(this.userdetails,  { Key? key}) : super(key: key);
  @override
  State<Deatails> createState() => _DeatailsState();
}
class _DeatailsState extends State<Deatails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details'
        ),

      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('ID:${widget.userdetails.id.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Name:${widget.userdetails.name.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Username:${widget.userdetails.body.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Email:${widget.userdetails.email.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
               // Text('Phone:${widget.userdetails.phone.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
              //  Text('Website:${widget.userdetails.website.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        //  Text('ID:${widget.userdetails.email.toString()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
