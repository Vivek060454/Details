
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../model/modelclass.dart';

class Network {
  Future<List<User>> userData() async {
    List<User> data = [];
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      data = userFromJson(response.body);
      print("Success");
    } else {
      throw Exception('Something went wrong');
    }
    return data;
  }

  postData({required String id, required String firstname}) async {
    Dio dio = Dio();
    final url = Uri.parse(
        'https://crudcrud.com/api/a727bcb21052439ebc1ea948b5e087d0/unicorns/$id');

    final data = {
      // "_id": "63b6b96932f90d03e8f1030d",
      "usertitle": firstname,
      "userdescription": "nccbb ",
      "firstname": "bcvbv ",
      "lastname": "ncbbb ",
      "email": "jhjbbh@gmail.com",
      "gender": "Male",
      "education": "Graduate Degree",
      "title": "ncbb ",
      "description": "hdcvv "
    };
    final respon = await dio.put(
        'https://crudcrud.com/api/a727bcb21052439ebc1ea948b5e087d0/unicorns/63b6b96932f90d03e8f1030d',
        data: data);
    if (respon.statusCode == 200) {
      print("object");
    } else {
      throw Exception('Something went wrong');
    }
  }
}
