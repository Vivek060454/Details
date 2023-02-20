import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'list.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _formKey =GlobalKey<FormState>();

  final TextEditingController o1Controller = new TextEditingController();

  final TextEditingController o2Controller = new TextEditingController();
  final TextEditingController o3Controller = new TextEditingController();

  final TextEditingController o4Controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {

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
            Container(

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
                child: Form(
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
                            Text('Enter OTP:',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ),

                      Form(
                        key: _formKey,
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(2),
                            3: FlexColumnWidth(2),


                          },

                          children: [

                            TableRow(
                                children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                          autofocus: false,
                            controller: o1Controller,
                            keyboardType: TextInputType.number,
                            inputFormatters: [LengthLimitingTextInputFormatter(1)],
                            onSaved: (value){
                              o1Controller.text=value!;
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
                            validator: (o1Controller){
                              if (o1Controller!='0'){
                                Fluttertoast.showToast(msg: "Enter valid OTP");
                                return '';
                              }

                              if (o1Controller!.isEmpty){
                                Fluttertoast.showToast(msg: "Please enter OTP");
                                return '';
                              }
                              //  if (!RegExp("^[a-ZA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(emailController))
                              //   {
                              //     return ("please enter the valid email");
                              //   }
                              //   return null;
                            },

                          ),
                        ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      autofocus: false,
                                      controller: o2Controller,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                                      onSaved: (value){
                                        o2Controller.text=value!;
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
                                      validator: (o2Controller){
                                        if (o2Controller!='0'){
                                          Fluttertoast.showToast(msg: "Enter valid OTP");
                                          return '';
                                        }

                                        if (o2Controller!.isEmpty){
                                          Fluttertoast.showToast(msg: "Please enter OTP");
                                          return '';
                                        }
                                        //  if (!RegExp("^[a-ZA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(emailController))
                                        //   {
                                        //     return ("please enter the valid email");
                                        //   }
                                        //   return null;
                                      },

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      autofocus: false,
                                      controller: o3Controller,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                                      onSaved: (value){
                                        o3Controller.text=value!;
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
                                      validator: (o3Controller){
                                        if (o3Controller!='0'){
                                          Fluttertoast.showToast(msg: "Enter valid OTP");
                                          return '';
                                        }

                                        if (o3Controller!.isEmpty){
                                          Fluttertoast.showToast(msg: "Please enter OTP");
                                          return '';
                                        }
                                        //  if (!RegExp("^[a-ZA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(emailController))
                                        //   {
                                        //     return ("please enter the valid email");
                                        //   }
                                        //   return null;
                                      },

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      autofocus: false,
                                      controller: o4Controller,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                                      onSaved: (value){
                                        o4Controller.text=value!;
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
                                      validator: (o4Controller){
                                        if (o4Controller!='0'){
                                          Fluttertoast.showToast(msg: "Enter valid OTP");
                                          return 'hi';
                                        }
                                        if (o4Controller!.isEmpty){
                                          Fluttertoast.showToast(msg: "Please enter OTP");
                                          return '00';
                                        }
                                        //  if (!RegExp("^[a-ZA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(emailController))
                                        //   {
                                        //     return ("please enter the valid email");
                                        //   }
                                        //   return null;
                                      },

                                    ),
                                  ),


                                ]
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 210,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          Text("Didn't receive OTP?"),
                          GestureDetector(onTap: (){
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Regis()));

                          },
                            child: Text('Resend OTP',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue),),),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                  SizedBox(
                    height: 40,
                    width: 300,
                    child: ElevatedButton(

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(  Color.fromRGBO(240, 0, 0, 40), ),
                        ),
                        onPressed: (){
                          if(_formKey.currentState!.validate())
                          {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Draweer() ));

                          }
                          // if(_formKey.currentState!.validate())
                          // {{
                          //   print('hi');
                          //
                          // //  Fluttertoast.showToast(msg: "Otp not verified");
                          //
                          // }
                          // }
                          // else{
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) =>Draweer() ));
                          // }

                        }, child: Text('Next',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)),
                  ),
                     // loginButton,
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
