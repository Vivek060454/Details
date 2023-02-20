
import 'package:http/http.dart' as http;
import '../model/model.dart';

import 'dart:convert';

import 'constant.dart';


Future<DemoModel> fetchData() async {
  final response = await http.get(Uri.parse('${(apiUrl)}/users'));
  if (response.statusCode == 200) {
    return DemoModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load DemoAPI');
  }
}