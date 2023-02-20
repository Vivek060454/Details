import 'package:sqlliteass/cl.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:sqlliteass/model/modelclass.dart';
class Netw{

  Future<List<Userdetails>> getd() async{
List<Userdetails> data=[];
final url =
Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments');

final response = await http.get(url);
if (response.statusCode == 200) {


  print('uhiu+${response.body}');
  data = userdetailsFromJson(response.body);
}
return data;
  }
}
