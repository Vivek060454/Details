import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:htttp/deatials.dart';
import 'dart:convert';
import 'package:htttp/modelm.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
Map? mapresponse;
List? listfact;
fetchdata() async {
  Dio dio=new Dio();
dynamic data={'postId': 1, 'id': 9,'name': "name", 'email': 'email','body':'igas'};
  var url = 'https://jsonplaceholder.typicode.com/comments?postId=1';
  var response = await dio.post(url, data:data,options: Options(
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    }
  ));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.data}');


}
// fetchdata() async{
//     var url =
//   Uri.parse("https://jsonplaceholder.typicode.com/posts");
//     // Await the http get response, then decode the json-formatted response.
//     var response = await http.get(url);
//     // http.StreamedResponse response = await request.send();
//     print(response.statusCode);
//     // print(await response.stream.bytesToString());
//   //  var responseString = await response.body;
//   if(response.statusCode==200){
//    print(response.body);
//     setState(() {
//       listfact= json.decode(response.body);
//   //listfact=json.decode(response.stream.bytesToString());
//   // mapres=mapresponse!['mobile'];
//   //  mapress=mapresponse!['time'];
//   //  listfact=mapresponse!['Payload'];
//     });
//   }
//   }
  @override
  void initState() {
    fetchdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
body: listfact==null?Container():ListView.builder(
  shrinkWrap: true,
scrollDirection: Axis.vertical,
  itemBuilder: (context,index){




  return Container(
    child: Column(
      children: [
        // Text(listfact![index]['id'].toString()),
        // Text(listfact![index]['userId'].toString()),
        // Text(listfact![index]['title'].toString()),
        // Text(listfact![index]['body'].toString())
      ],
    ),
  );
},
itemCount:listfact==null? 0:listfact!.length,),
    );
  }
}
//child: Text(postList[index].category.toString()),
// Text('User ID:${userdetails[index].id}'),
// Text('ID: ${userdetails[index].email}'),
// Text('Title: ${userdetails[index].address}'),
// Text('Body: ${userdetails[index].phone}',maxLines: 1,),