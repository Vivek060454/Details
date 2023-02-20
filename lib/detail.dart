import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class deta extends StatefulWidget {
  const deta({Key? key}) : super(key: key);

  @override
  State<deta> createState() => _detaState();
}

class _detaState extends State<deta> {
  final _formKey =GlobalKey<FormState>();
  final TextEditingController phoneController = new TextEditingController();
  TextEditingController dateInputController = TextEditingController();
  TextEditingController jonController = TextEditingController();
  final LocalStorage storage = new LocalStorage('localstorage_app');
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          width: 360,


          child:FloatingActionButton
            (
            backgroundColor:Colors.blue,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              if(_formKey.currentState!.validate())
              {
                setState(()
                {
                  phoneController.text;

                  storage.setItem('phone',phoneController.text);
                Navigator.pop(context);


                  // Navigator.of(context).pop(Sellpanelupload);
                });
              }




            },
            child: Text('Next'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      autofocus: false,
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      onSaved: (value){
                        phoneController.text=value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "Enter Number",
                          suffixIcon: const Icon(Icons.perm_contact_cal_rounded,color: Colors.blue,),
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Enter Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)

                          )

                      ),
                      validator: (value){
                        if(value==null||value.isEmpty)
                        {
                          return "Enter your phone number";
                        }
                        if(value.length>10||value.length<10)
                        {
                          return "Enter your valid phone number";
                        }
                      },



                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
