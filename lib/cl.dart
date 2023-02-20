// To parse this JSON data, do
//
//     final userdetails = userdetailsFromMap(jsonString);

import 'dart:convert';


List<Userdetails> userdetailsFromJson(String str) => List<Userdetails>.from(json.decode(str).map((x) => Userdetails.fromJson(x)));

String userdetailsToJson(List<Userdetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Userdetails {
  Userdetails({
   this.postId,
   this.id,
   this.name,
   this.email,
   this.body,
  });

  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  factory Userdetails.fromJson(Map<String, dynamic> json) => Userdetails(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}

