import 'package:asss/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';

import 'homesc.dart';

class Scren1 extends StatefulWidget {
  const Scren1({Key? key}) : super(key: key);

  @override
  State<Scren1> createState() => _Scren1State();
}

class _Scren1State extends State<Scren1> {
  final _formKey =GlobalKey<FormState>();
  final TextEditingController nameController = new TextEditingController();
  TextEditingController dateInputController = TextEditingController();
  TextEditingController jonController = TextEditingController();
  final types = [
   'Male','Female'

  ];
  final LocalStorage storage = new LocalStorage('localstorage_app');
  var type = null;
  DateTimeRange dateRange=DateTimeRange(
      start:DateTime.now(),
      end: DateTime.now())
  ;
  String initValue="Select your Birth Date";

  bool isDateSelected= false;
  DateTime? birthDate; // instance of DateTime
  String? birthDateInString;
  final TextEditingController phoneEController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if( jonController.text.isEmpty){

    }
    final name = storage.getItem('name');
    final name1 = storage.getItem('name1');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(0),

                color: Colors.white,


                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, //New
                    blurRadius: 15.0,
                  )
                ],





              ),
              child: Icon(Icons.arrow_back,color: Colors.green,)),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          width: 360,


          child:FloatingActionButton
            (
            backgroundColor:Colors.green,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              if( name.isEmpty){
                Fluttertoast.showToast(msg: "Job location empty");
              }
              if(_formKey.currentState!.validate())
              {
                setState(()
                {
                 nameController.text;
                 dateInputController.text;
                 jonController.text;
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeS()));



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
                Text('Lets create your profile',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,),),
                const SizedBox(
                  height: 30,
                ),
                Center(
              child: Container(
                width: 350,
                height: 50,
                child: TextFormField(
                  autofocus: false,
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value){
                    nameController.text=value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "FULL NAME",
                      suffixIcon: const Icon(Icons.perm_contact_cal_rounded,color: Colors.green,),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "FULL NAME",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0)

                      )

                  ),
                  validator: (value){
                    if(value==null||value.isEmpty)
                    {
                      return "Enter your name";
                    }
                    return null;
                  },



                ),
              ),
            ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 350,
                  height: 50,
                  child: TextFormField(
                    decoration:  InputDecoration(
                      hintText: 'Date Of Birth',
                      labelText: 'Date Of Birth',
                      suffixIcon: const Icon(Icons.calendar_today,color: Colors.green,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)

                        )

                    ),
                    controller: dateInputController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));

                      if (pickedDate != null) {
                        dateInputController.text =pickedDate.toString().substring(1,10);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 350,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: Colors.grey),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,

                        hint:Text("Gender", ),

                        value: type,
                        items:  types.map((ite) =>
                            DropdownMenuItem<String>(
                              value: ite,

                              child: Text(ite, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromARGB( 255, 43, 72, 101))
                              )
                              ,))
                            .toList(),
                        onChanged: (items) =>
                            setState(() => type = items),),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                name==null? InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Searr()));
                  },
                  child: Container(
                    width: 350,
                    height: 50,

                    decoration: BoxDecoration(
                        border:Border.all()


                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(' Job City',style: TextStyle(fontSize: 19,color: Colors.grey),),
                    ),
                  ),
                ):

                Container(
                  width: 350,
                  height: 50,

                  child: InkWell(
                    onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>Searr()));
                    },
                    child: TextFormField(
                      autofocus: false,

                      initialValue:   name.toString()??'',
                      // onSaved: (value){
                      //   jonController .text=value!;
                      // },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: 'Job City',
                          labelText: 'Job City',

                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)

                          )

                      ),




                    ),
                  ),

                ),
                const SizedBox(
                  height: 30,
                ),

                name==null? Container():

                Container(
                  width: 350,
                  height: 50,

                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Searr()));
                    },
                    child: TextFormField(
                      autofocus: false,

                      initialValue:   name1.toString()??'',
                      // onSaved: (value){
                      //   jonController .text=value!;
                      // },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: 'Job Location',
                          labelText: 'Job Location',

                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)

                          )

                      ),




                    ),
                  ),

                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
