
import 'dart:convert';


List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class User {
  User({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    userId: json["userId"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "title": title,
    "body": body,
  };
}
