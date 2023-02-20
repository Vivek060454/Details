import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:localstorage/localstorage.dart';

import 'detail.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  @override
  void initState() {
    // TODO: implement initState
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final phone = storage.getItem('phone');
    return Scaffold(
      appBar: AppBar(
        title: Text('Call'),
      ),
      drawer: Drawer(
          child: Column(
            children: [
SizedBox(
              height: 110,
          ),
              ListTile(
                title: InkWell(
                    onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=>deta()));
                    },
                    child: Text('Contact',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
              ),
            ],
          )
      ),
      body:  Column(
        children: [
          InkWell(
              onTap: (){
                setState(() {

                });
              },
              child: Icon(Icons.refresh_rounded)),

          SizedBox(
            height: 100,
          ),
          InkWell(

            onTap: (){
              FlutterPhoneDirectCaller.callNumber(phone.toString());
            },
            child: Text(phone.toString(),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),


    );
  }
}
