import 'package:asss/screen.dart';
import 'package:asss/sear1data.dart';
import 'package:asss/searc2data.dart';
import 'package:asss/search2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:localstorage/localstorage.dart';

class Searr2 extends StatefulWidget {

  final book;
  const Searr2(this.book, {Key? key}) : super(key: key);
  @override
  State<Searr2> createState() => _Searr2State();
}

class _Searr2State extends State<Searr2> {
  final controller=TextEditingController();

  List<Book1> books1=allBook1;
  final LocalStorage storage = new LocalStorage('localstorage_app');
  @override
  Widget build(BuildContext context) {
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
              child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back,color: Colors.green,))),
        ),

      ),
      body: Column(
        children: [
      Container(
width: 350,
height: 50,
child: TextFormField(
// controller: _templenameController,
textInputAction: TextInputAction.next,
keyboardType: TextInputType.streetAddress,
initialValue:widget.book.title.toString(),


decoration: InputDecoration(
fillColor: Colors.grey.shade100,
filled: true,
labelText:'Job Location ' ,
hintText: 'Job Location ',
hintStyle: const TextStyle(
height: 2, fontWeight: FontWeight.bold),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(8)
),
),
// The validator receives the text that the user has entered.
validator: (value) {
if (value == null || value.isEmpty) {
return 'Please enter Job Location';
}
return null;
},
),
),
          SizedBox(
            height: 30,
          ),
          Container(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color:Colors.black26),
                  )
              ),
              onChanged: searchBook,
            ),
          ),
          Expanded(child: ListView.builder(
              itemCount: books1.length,
              itemBuilder: (context,index){
                final book1=books1[index];
                return ListTile(
                  title: Text(book1.title),
                  onTap: (){
                    storage.setItem('name1', book1.title);
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Scren1()));
                  },
                );
              }))
        ],
      ),
    );
  }

  void searchBook(String query) {
    final suggestions=allBook1.where((book1) {
      final book1Title =book1.title.toLowerCase();
      final input =query.toLowerCase();
      return book1Title.contains(input);

    }).toList();
  setState(() =>books1=suggestions.cast<Book1>());
    // final suggestions =allBooks1.where((book1) {
    //   final book1Title =book1.title.toLowerCase();
    //   final input =query.toLowerCase();
    //   return book1Title.contains(input);
    //
    // }).toList();
    // setState(() =>books1=suggestions.cast<Book1>());
  }
}
