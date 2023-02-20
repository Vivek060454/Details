import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled15/Usermodel.dart';

import '../constant.dart';

class WebServise{
 callProfileApi() async {
  var url = Uri.parse('${{apiUrl}}/de');
  var response = await http.get(url, );
  if(response.statusCode==200){
   print('Response status: ${response.statusCode}');
   print('Response body: ${jsonDecode(response.body)}');
   return response;

  }
  return null;
 }
}