import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Usermodel.dart';
import 'app_bloc.dart';
import 'app_events.dart';
import 'app_state.dart';

class Home extends StatefulWidget {
  const Home({super.key, });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(ButtonClickEvent());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Home"),
          ),
          body: Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                    BlocBuilder <ProfileBloc,ProfileState>(
                  builder:(context,state){
                    if(state is ProfileLoading){
                      CircularProgressIndicator();
                    }
                    if(state is ProfileSuccess){
                      ProfileModel model=state.model;
                      return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                          ),
                          itemCount:   model.item.length,
                          itemBuilder: (context, index) {
                           // final  produc = snapshot.data!.docs[index];
                            return Container(
                              //color: Colors.white,
                              margin: const EdgeInsets.only(top: 5,
                                  bottom: 5, left: 5, right: 5),
                              constraints: const BoxConstraints(
                                  minWidth: 160,
                                  minHeight: 220
                              ),
                              // border: Border.all(color: const  Color.fromARGB(255,95 , 111, 148)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,

                              ),
                              // width: 100,
                              //  height: 150,
                              child:Text(model.item[index].name) ,);
                          });
                      // return Text(
                      // model.item[0].name
                      // );
                    }
                    if(state is ProfileSError){
                      return Text(state.msg);                    }
                    return Text('Somethingf Went wrong');

                  }


                    ),



              ],
            ),

           // This trailing comma makes auto-formatting nicer for build methods.
        ),

    );

  }
}
