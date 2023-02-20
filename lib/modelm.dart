

import 'dart:convert';

// List<UserDetails> parseProduct(String responsebody){
//   final parse=json.decode(responsebody).cast<Map<String,dynamic>>();
//   return parse.map<UserDetails>((json)=>UserDetails.fromMap(json)).toList();
//
//
// }

// List<UserDetails> parseUserdetails(String response){
//   final parse= json.decode(response).cast<Map<String,dynamic>>();
//   return parse.map<UserDetails>((json)=> UserDetails.fromMap(json)).toList();
// }





class UserDetails{
  final String userid;
  final String id;
  final String title;
  final String body;

 UserDetails(
    this.userid,
    this.id,
    this.title,
    this.body,
);
 factory UserDetails.fromJson(Map<String, dynamic>json){
   return UserDetails(
       json["userid"],
       json["id"],
       json["title"],
       json["body"],
   );

 }

}
