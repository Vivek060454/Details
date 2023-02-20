// To parse this JSON data, do
//
//     final profileModel = profileModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ProfileModel> profileModelFromMap(String str) => List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromMap(x)));

String profileModelToMap(List<ProfileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProfileModel {
  ProfileModel({
    required this.name,
    required this.item,
  });

  String name;
  List<Item> item;

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
    name: json["name"],
    item: List<Item>.from(json["item"].map((x) => Item.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "item": List<dynamic>.from(item.map((x) => x.toMap())),
  };
}

class Item {
  Item({
    required this.name,
    required this.request,
    required this.response,
  });

  String name;
  Request request;
  List<Response> response;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    name: json["name"],
    request: Request.fromMap(json["request"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "request": request.toMap(),
    "response": List<dynamic>.from(response.map((x) => x.toMap())),
  };
}

class Request {
  Request({
    required this.method,
    required this.header,
    required this.body,
    required this.url,
  });

  String method;
  List<dynamic> header;
  Body body;
  Url url;

  factory Request.fromMap(Map<String, dynamic> json) => Request(
    method: json["method"],
    header: List<dynamic>.from(json["header"].map((x) => x)),
    body: Body.fromMap(json["body"]),
    url: Url.fromMap(json["url"]),
  );

  Map<String, dynamic> toMap() => {
    "method": method,
    "header": List<dynamic>.from(header.map((x) => x)),
    "body": body.toMap(),
    "url": url.toMap(),
  };
}

class Body {
  Body({
    required this.mode,
    required this.raw,
    required this.options,
  });

  String mode;
  String raw;
  Options options;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    mode: json["mode"],
    raw: json["raw"],
    options: Options.fromMap(json["options"]),
  );

  Map<String, dynamic> toMap() => {
    "mode": mode,
    "raw": raw,
    "options": options.toMap(),
  };
}

class Options {
  Options({
    required this.raw,
  });

  Raw raw;

  factory Options.fromMap(Map<String, dynamic> json) => Options(
    raw: Raw.fromMap(json["raw"]),
  );

  Map<String, dynamic> toMap() => {
    "raw": raw.toMap(),
  };
}

class Raw {
  Raw({
    required this.language,
  });

  String language;

  factory Raw.fromMap(Map<String, dynamic> json) => Raw(
    language: json["language"],
  );

  Map<String, dynamic> toMap() => {
    "language": language,
  };
}

class Url {
  Url({
    required this.raw,
    required this.host,
    required this.path,
  });

  String raw;
  List<String> host;
  List<String> path;

  factory Url.fromMap(Map<String, dynamic> json) => Url(
    raw: json["raw"],
    host: List<String>.from(json["host"].map((x) => x)),
    path: List<String>.from(json["path"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "raw": raw,
    "host": List<dynamic>.from(host.map((x) => x)),
    "path": List<dynamic>.from(path.map((x) => x)),
  };
}

class Response {
  Response({
    required this.name,
    required this.originalRequest,
    required this.status,
    required this.code,
    required this.postmanPreviewlanguage,
    required this.header,
    required this.cookie,
    required this.body,
  });

  String name;
  Request originalRequest;
  String status;
  int code;
  String postmanPreviewlanguage;
  List<Header> header;
  List<dynamic> cookie;
  String body;

  factory Response.fromMap(Map<String, dynamic> json) => Response(
    name: json["name"],
    originalRequest: Request.fromMap(json["originalRequest"]),
    status: json["status"],
    code: json["code"],
    postmanPreviewlanguage: json["_postman_previewlanguage"],
    header: List<Header>.from(json["header"].map((x) => Header.fromMap(x))),
    cookie: List<dynamic>.from(json["cookie"].map((x) => x)),
    body: json["body"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "originalRequest": originalRequest.toMap(),
    "status": status,
    "code": code,
    "_postman_previewlanguage": postmanPreviewlanguage,
    "header": List<dynamic>.from(header.map((x) => x.toMap())),
    "cookie": List<dynamic>.from(cookie.map((x) => x)),
    "body": body,
  };
}

class Header {
  Header({
    required this.key,
    required this.value,
    required this.name,
    required this.description,
    required this.type,
  });

  String key;
  String value;
  String name;
  String description;
  String type;

  factory Header.fromMap(Map<String, dynamic> json) => Header(
    key: json["key"],
    value: json["value"],
    name: json["name"],
    description: json["description"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "key": key,
    "value": value,
    "name": name,
    "description": description,
    "type": type,
  };
}
