import 'package:flutter/material.dart';

import 'package:vikas/Model%20Class/user_model.dart';
import 'package:vikas/network.dart';

class Edit extends StatefulWidget {
  List<User> userData;
  Edit({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  Network network = Network();
  final name = TextEditingController();
  final lastName = TextEditingController();

  @override
  void initState() {
    setData();
    super.initState();
  }

  setData() {
    name.text = widget.userData[0].firstname;
    lastName.text = widget.userData[0].lastname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: name,
          ),
          TextField(
            controller: lastName,
          ),
          TextField(
            controller: lastName,
          ),
          MaterialButton(
            child: Text("Post"),
            color: Colors.green,
            onPressed: () {
              network.postData(id: widget.userData[0].id, firstname: name.text);
            },
          )
        ],
      ),
    );
  }
}
