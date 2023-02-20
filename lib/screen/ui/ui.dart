
import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../../repository/api.dart';
import '../widget/widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<DemoModel>? futureModel;
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: buildScreen(context),
    );
  }

  Widget buildScreen(BuildContext context) => Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildBtn(),
        buildHeightSpacer(25.00),
        buildFutureTextData(context),
      ],
    ),
  );

  buildFutureTextData(BuildContext context) => FutureBuilder<DemoModel>(
    future: futureModel,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return buildTextData(snapshot.data!.item.toString());
      } else if (snapshot.hasError) {
        return buildTextData("Error");
      }
      return CircularProgressIndicator();
    },
  );

  Widget buildBtn() => ElevatedButton(

    child: Text("Get Data"),
    onPressed: () => setState(() {
      futureModel = fetchData();
    }),
  );
}