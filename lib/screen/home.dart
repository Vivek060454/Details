import 'package:flutter/material.dart';
import '../model/modelclass.dart';
import 'network.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Network network = Network();

  List<User> userData = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    userData = await network.userData();
    print(userData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                   // Navigator.of(context).push(MaterialPageRoute(
                     // builder: (context) => Edit(userData: userData),
                   // ));
                  },
                  child: ListTile(
                    title: Text(userData[index].id.toString()),
                    subtitle: Text(userData[index].title.toString()),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
