import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'SO/Home.dart';
import 'SO/register.dart';
import 'login.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        textTheme:
        const TextTheme(
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          subtitle1: TextStyle(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.white,
        errorColor: Colors.red,
        colorScheme: ThemeData().colorScheme.copyWith(primary: Color.fromRGBO(220, 95, 0, 1),),
      ),
      home: const Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  final _auth =FirebaseAuth.instance;
  final storage=new FlutterSecureStorage();
  Future<bool>checkLogin()async{
    String? value = await storage.read(key: "uid") ;
    if(value==null){
      return false;
    }
    return true;
  }

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
          () =>
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                  FutureBuilder(
                    future: checkLogin(),
                    builder:(BuildContext context,AsyncSnapshot<bool> snapshot){
                      if(snapshot.data==false){
                        return Login();
                      }
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Container(
                          color: Colors.white,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return Home();
                    } ,
                  )
              )
          ),
// if (_auth==null)
//             {
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder:
//                     (context) =>  Login(),
//
//                 )
//             );}
// else{
//   Navigator.pushReplacement(context,
//       MaterialPageRoute(builder:
//       (context) =>  Draweer()));
// }

    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(

    );

  }
}
