import 'package:asss/sear1data.dart';
import 'package:asss/search2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:localstorage/localstorage.dart';

class Searr extends StatefulWidget {
  const Searr({Key? key}) : super(key: key);

  @override
  State<Searr> createState() => _SearrState();
}

class _SearrState extends State<Searr> {
  final controller=TextEditingController();
  List<Book> books=allBooks;
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
                itemCount: books.length,
                itemBuilder: (context,index){
                  final book=books[index];
                  return ListTile(
                    title: Text(book.title),
                    onTap: (){
                      storage.setItem('name', book.title);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Searr2(book)));
                    },
                  );
                }))
          ],
        ),
      ),
    );
  }

  void searchBook(String query) {
    final suggestions =allBooks.where((book) {
      final bookTitle =book.title.toLowerCase();
      final input =query.toLowerCase();
      return bookTitle.contains(input);

    }).toList();
    setState(() =>books=suggestions);
  }
}
