import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'gr.dart';

class HomeS extends StatefulWidget {
  const HomeS({Key? key}) : super(key: key);

  @override
  State<HomeS> createState() => _HomeSState();
}

class _HomeSState extends State<HomeS> {

  List<Course> corcess=new List.empty(growable: true);
  bool selectAll=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    corcess.add(Course('Accountant',false));
    corcess.add(Course("Data",false));
    corcess.add(Course("Developer",false));
    corcess.add(Course("CSS",false));
    corcess.add(Course("Sales",false));
    corcess.add(Course("Data",false));
    corcess.add(Course("JQuery",false));
    corcess.add(Course("Sales",false));
    corcess.add(Course("Data",false));
    corcess.add(Course("JQuery",false));

  }


  @override
  Widget build(BuildContext context) {
    final controller=TextEditingController();

    return Scaffold(

     body: SingleChildScrollView(
       scrollDirection: Axis.vertical,
       child: SafeArea(
         child: Column(
           children: [
                Padding(
               padding: const EdgeInsets.all(13.0),
               child: Text("Lets Start by Selecting your Area of Interest",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
             ),
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(20),
                   topLeft: Radius.circular(20),
                 ),

                 color:   Colors.blue,
               ),
               child: Column(
                 children: [
                   SizedBox(
                     height: 20,
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('Choose Your Category',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25),),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('You have to choose atleast one categoris',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 20),),
                   ),
                   SizedBox(
                     height: 20,
                   ),

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
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
                        // onChanged: searchBook,
                       ),
                     ),
                   ),

                   GridView.builder(

                     shrinkWrap: true,
                     itemBuilder: (ctx,index){
                       return prepareList(index);
                     },
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                       (crossAxisCount: 3),
                     itemCount: corcess.length,
                   ),

                 ],
               ),
             )
           ],
         ),
       ),
     ),
    );
  }
  Widget prepareList(int k)
  {
    return Card(
      child: Hero(
        tag: "text$k",
        child: Material(
          child: InkWell(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),

                color:   Colors.lightBlue,
              ),
              height: 100,
              child: Stack(
                children: [
                  Center(child: Text(corcess[k].name,style: TextStyle(color: Colors.black26,fontSize: 20),)),
                  Positioned(child: Checkbox(value: corcess[k].selected, onChanged: (bool? value) {
                    setState(() {
                      if(!value!)
                        selectAll=false;
                      corcess[k].selected=value!;

                    });
                  },))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Course{
  String name;
  bool selected;
  Course(this.name,this.selected);
}

