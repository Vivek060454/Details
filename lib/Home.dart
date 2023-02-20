import 'dart:convert';

import 'package:asss/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'model.dart';
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _formKey =GlobalKey<FormState>();
  final TextEditingController numbController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();
 // final _auth =FirebaseAuth.instance;

  final storage=new FlutterSecureStorage();

  List<Users> usersList=[];
  getData()async{

    final response =await http.get(Uri.parse('https://api1.press.fit/pressfit-api/slpapp-slp-mobile'));
    var data = jsonDecode(response.body);

    if(response.statusCode==200){
      for(Map u in data){
        Users users=Users(status: u["status"], result: u["result"], slpCode: u[" slpCode"], slpName: u["slpName"], mobile: u["mobile"], mgt: u["mgt"]);
        usersList.add(users);
      }

    }
    return  usersList;

  }
  @override
  Widget build(BuildContext context) {
    final numb= TextFormField(
      autofocus: false,
      controller: numbController,
      keyboardType: TextInputType.phone,
      onSaved: (value){
        numbController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //  prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0)
          )
      ),
      validator: (numbController){
        if (numbController!.length<10||numbController!.length>10){

          Fluttertoast.showToast(msg: "User not found");
          return '';
        }


        if (numbController!.isEmpty){
          return ("Please enter the value");

        }
        //  if (!RegExp("^[a-ZA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(emailController))
        //   {
        //     return ("please enter the valid email");
        //   }
        //   return null;
      },

    );

    final loginButton =SizedBox(
      height: 40,
      width: 300,
      child: ElevatedButton(

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(  Color.fromRGBO(240, 0, 0, 40), ),
          ),
          onPressed: (){
            if(_formKey.currentState!.validate())
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Otp() ));
            }
            // if(_formKey.currentState!.validate()){
            //   //getData();
            // //  Fluttertoast.showToast(msg: "User not found");
            //
            // }
            // else{
            //   Navigator.push(context, MaterialPageRoute(builder: (context) =>Otp() ));
            //
            // }


          }, child: Text('Next',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 0, 0, 40),
      body: SingleChildScrollView(
        child: Column(

         children: [
           
           Align(
             alignment: Alignment.center,
             child: Padding(
               padding: const EdgeInsets.fromLTRB(0, 125, 10, 0),
               child: Text('DELIVERY BOY',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
             ),
           ),
SizedBox(
  height: 80,
),
           Form(
             key: _formKey,
             child: Container(

               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                 ),

                 color:   Colors.white
               ),

               //color: Colors.black,
               child: Padding(
                 padding: const EdgeInsets.only(
                   top: 0, bottom: 0, left: 0,right: 0,),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 30,
                     ),

                     Padding(
                       padding: const EdgeInsets.only(
                         top: 30, bottom: 0, left: 20,right: 20,),
                       child: Row(
                         children: [
                           Text('Enter mobile number:',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                         ],
                       ),
                     ),

                     Padding(
                       padding: const EdgeInsets.only(
                         top: 10, bottom: 0, left: 20,right: 20,),
                       child: numb,
                     ),
                     SizedBox(
                       height: 250,
                     ),
                   loginButton,
                     SizedBox(
                       height: 300,
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ],
        ),
      ),

    );
  }

}
// C,