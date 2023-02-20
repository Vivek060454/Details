import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlliteass/netw.dart';
import 'package:sqlliteass/screen/network.dart';

import 'cl.dart';

class Ho extends StatefulWidget {
  const Ho({Key? key}) : super(key: key);

  @override
  State<Ho> createState() => _HoState();
}

class _HoState extends State<Ho> {
  Netw newt =Netw() ;
  List <Userdetails> useer=[];
  getda()async{
    useer=await newt.getd();
    print( useer);
  }

  @override
  void initState() {
    getda();
    setState(() {

    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hi'),
      ),
      body: ListView.builder(
          itemCount: useer.length,
          itemBuilder: (context,index){
            print(useer.length);
        return ListTile(
          title: Text(useer[index].email.toString()),
        );
      }),
    );
  }
}
