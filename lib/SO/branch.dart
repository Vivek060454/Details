import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sto/SO/subject.dart';

class Branch extends StatefulWidget {
  final produce;
 Branch(this.produce, {Key? key}) : super(key: key);

  @override
  State<Branch> createState() => _BranchState();
}

class _BranchState extends State<Branch> {
String name='';
  get departmentStream =>FirebaseFirestore.instance.collection

    ('department').
  where('department',isEqualTo: widget.produce.toString()).





  snapshots();

  void initState() {
    final _auth = FirebaseAuth.instance;

    CollectionReference department = FirebaseFirestore.instance.
    collection('department');
    super.initState();
  }
  final List storedocs = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream:FirebaseFirestore.instance.
    collection('department').where('department',isEqualTo: widget.produce.toString()).


    snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot) {
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) async {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();
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
                          blurRadius: 13.0,
                        )
                      ],

                    ),
                    child: IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon:Icon(Icons.arrow_back,color: const  Color.fromRGBO(220, 95, 0, 1)),)),
              ),
              title:  TextField(

                decoration: InputDecoration(
                   suffixIcon: Icon(Icons.search,color: const  Color.fromRGBO(220, 95, 0, 1)), hintText: 'Search Branch & Sem...',),
                onChanged: (val) {

                  setState((){
                    name=val;
                  });

                },
              ),

            // actions: [
            //
            //   IconButton(onPressed: (){}, icon: Icon(Icons.search,color: const  Color.fromRGBO(220, 95, 0, 1)))
            // ],
            ),
              //  title: const Text('Tritan Bikes'),

           body: ListView.builder(
               itemCount: snapshot.data!.docs.length,
               itemBuilder: (context,index){
                 final  produc = snapshot.data!.docs[index];
                 if(name.isEmpty){
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       decoration: BoxDecoration(

                           borderRadius: BorderRadius.circular(10),
                           color: Colors.white,
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey, //New
                               blurRadius: 13.0,
                             )
                           ]
),
                       child: ListTile(
                         title: Text( produc!["branch_&_sem"],style: TextStyle(fontWeight: FontWeight.bold,),),
                         subtitle: Text( produc!["subject"],style: TextStyle(fontWeight: FontWeight.w500),),
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Subject(produc)));
                         },
                       ),
                     ),
                   );
                 }
                 if( produc!["branch_&_sem"].toString().toLowerCase().startsWith(name.toLowerCase())){
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       decoration: BoxDecoration(

                         borderRadius: BorderRadius.circular(0),

                         color: Colors.white,


                         boxShadow: [
                           BoxShadow(
                             color:  Color.fromRGBO(220, 95, 0, 1),
                             blurRadius: 15.0,
                           )
                         ],





                       ),
                       child: ListTile(
                         title: Text( produc!["branch_&_sem"],style: TextStyle(fontWeight: FontWeight.bold,),),
                         subtitle: Text( produc!["subject"],style: TextStyle(fontWeight: FontWeight.w500),),
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Subject(produc)));
                         },
                       ),
                     ),
                   );
                 }
                 return Container();

           })


          );
        }
    );
  }
}
