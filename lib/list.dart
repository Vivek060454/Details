import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Draweer extends StatefulWidget {
  const Draweer({Key? key}) : super(key: key);

  @override
  State<Draweer> createState() => _DraweerState();
}

class _DraweerState extends State<Draweer> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.black54,

      appBar: PreferredSize(

        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text('DELIVERY BOY',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(240, 0, 0, 40),),),



          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Container(
                      height: 80,
                      width: 50,

                      child: IconButton(onPressed: () {  }, icon: Icon(Icons.menu,color: Color.fromRGBO(240, 0, 0, 40) ,),)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Container(
                      height: 80,
                      width: 50,

                      child: IconButton(onPressed: () {  }, icon: Icon(Icons.account_box_sharp,color: Color.fromRGBO(240, 0, 0, 40) ,),)),
                ),
              ],
            ),
          ],
          elevation: 0,
        ),
      ),



      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [

              Row(
                children: [
                  Text('Hi,',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ],
              ),
SizedBox(
  height: 30,
),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                     bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),



                    ),
                  boxShadow: [

                    BoxShadow(

                        color: Colors.grey,



                        offset: Offset(0,2)),

                    BoxShadow(

                        color: Color.fromRGBO(0, 0, 100, 0),

                        offset: Offset(3, 3),

                        blurRadius: 2,

                        spreadRadius: 5)

                  ],
                    color:   Color.fromRGBO(240, 0, 0, 40),
                ),

                child: Column(
                  children: [
                    Table(

                      columnWidths: {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(2),



                      },

                      children: [

                        TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text('Reach restaurant by 1:00 pm',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                   SizedBox(
                                     height: 20,
                                   ),

                                    Row(
                                      children: [
                                        Text('Order no 1452',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white)),
                                      ],
                                    )
                                  ],
                                ),
                              ),

SizedBox(height:125,width:125,child: Icon(Icons.downloading,color: Colors.white,size:60 ,))

                            ]
                        ),


                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(

                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),

                          ),

                          color:   Colors.white
                      ),

                      child: Column(
                        children: [
                          Table(
                            border: TableBorder(verticalInside: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid)),

                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(2),



                            },

                            children: [

                              TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text('View directions',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,),),



                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text('View details',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,),),



                                        ],
                                      ),
                                    ),


                                  ]
                              ),


                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
SizedBox(
  height: 30,
),
              Row(
                children: [
                  Text('Upcoming Deliveries,',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),

                ],
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0,8,13,0),
                child:   Container(

                  height: 150,

                  width: 360,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:  BorderRadius.circular(13),

                    border: Border.all(color: Colors.grey,),

                    boxShadow: [

                      BoxShadow(

                          color: Colors.grey,



                          offset: Offset(0,- 3)),

                      BoxShadow(

                          color: Color.fromRGBO(0, 0, 100, 0),

                          offset: Offset(3, 3),

                          blurRadius: 2,

                          spreadRadius: 5)

                    ],

                  ),

                  child:   Padding(

                    padding: const EdgeInsets.all(8.0),

                    child: Column(

                      children: [
                        Table(
                          columnWidths: {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(2),
                            //  2: FlexColumnWidth(4),
                          },
                           children: [
                            TableRow(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order No 1452',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text('Reach restaurant by 1:00 pm',style: TextStyle(fontSize: 15,),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text('Rs 250',style: TextStyle(fontSize: 15,),),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                     Column(
                                        children: [
                                          Text('Samkit Sharma',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                     Column(
                                        children: [
                                          Text('Andheri, Mumbai',style: TextStyle(fontSize: 15,),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        children: [
                                          Text('20 mins from restaurant',style: TextStyle(fontSize: 15,),),
                                        ],
                                      )
                                    ],
                                  ),

                                ]
                            ),

                          ],
                        ),


                        SizedBox(
                          height: 20,
                        ),




                      ],

                    ),

                  ),





                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,8,13,0),
                child:   Container(

                  height: 150,

                  width: 360,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:  BorderRadius.circular(13),

                    border: Border.all(color: Colors.grey,),

                    boxShadow: [

                      BoxShadow(

                          color: Colors.grey,



                          offset: Offset(0,- 3)),

                      BoxShadow(

                          color: Color.fromRGBO(0, 0, 100, 0),

                          offset: Offset(3, 3),

                          blurRadius: 2,

                          spreadRadius: 5)

                    ],

                  ),

                  child:   Padding(

                    padding: const EdgeInsets.all(8.0),

                    child: Column(

                      children: [
                        Table(
                          columnWidths: {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(2),
                            //  2: FlexColumnWidth(4),
                          },
                          children: [
                            TableRow(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order No 1452',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text('Reach restaurant by 1:00 pm',style: TextStyle(fontSize: 15,),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text('Rs 250',style: TextStyle(fontSize: 15,),),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Text('Samkit Sharma',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        children: [
                                          Text('Andheri, Mumbai',style: TextStyle(fontSize: 15,),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        children: [
                                          Text('20 mins from restaurant',style: TextStyle(fontSize: 15,),),
                                        ],
                                      )
                                    ],
                                  ),

                                ]
                            ),

                          ],
                        ),


                        SizedBox(
                          height: 20,
                        ),




                      ],

                    ),

                  ),





                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

