import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:localstorage/localstorage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sto/SO/branch.dart';
import 'package:text_scroll/text_scroll.dart';

import '../login.dart';
import 'Adverdetails.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  final LocalStorage storagee = new LocalStorage('localstorage_app');
  final LocalStorage stor = new LocalStorage('localstorage_app');
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final storage=new FlutterSecureStorage();
  get AdvertiseStream =>FirebaseFirestore.instance.collection
    ('Advertise').
  snapshots();
  void initState() {
    final _auth = FirebaseAuth.instance;
    CollectionReference Advertise = FirebaseFirestore.instance.
    collection('Advertise');
    super.initState();
  }
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    final name = storagee.getItem('name');
    final email = stor.getItem('email');
    return StreamBuilder<QuerySnapshot>(stream:AdvertiseStream,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot) {
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List  storedocs  = [];
          snapshot.data!.docs.map((DocumentSnapshot document) async {
            Map a = document.data() as Map<String,dynamic>;
            storedocs .add(a);
            a['id'] = document.id;
          }).toList();
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('hi'),
              elevation: 0,
                backgroundColor: Colors.white,

                leading: Padding(
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
                        ],
                      ),
                      child: IconButton(onPressed: ()async {
                      _scaffoldKey.currentState!.openDrawer();

                        // FirebaseAuth.instance.signOut();
                        // await storage.delete(key: 'uid');
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));
                      }, icon:Icon(Icons.menu,color: const  Color.fromRGBO(220, 95, 0, 1)),)),
                )


            ),
            drawer: Drawer(

              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
                child: Container(
                  child: ListView(
                    //Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      SizedBox(
                        height: 190,
                        child:UserAccountsDrawerHeader(
                          accountEmail:Text(email.toString()),
                          accountName: Text(name.toString()),
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Colors.white,
                            child:Text(name.toString()[0].toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Color.fromRGBO(220, 95, 0, 1)))
                            // backgroundImage: AssetImage("assets/Tritan-bike.png",),
                          ),
                        ),



                      ),


                      ListTile(
                        leading: const Icon(Icons.contacts_rounded,color: Color.fromRGBO(220, 95, 0, 1),),
                        title: const Text("Contact Us",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(220, 95, 0, 1)),),
                        onTap: ()  async {
                          // Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) =>ContactUs()));
                          //  Navigator.popAndPushNamed(context, 'login');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.info_outlined,color: Color.fromRGBO(220, 95, 0, 1),),
                        title: const Text("About Us",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(220, 95, 0, 1))),
                        onTap: ()  async {
                          // Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) =>Aboutus()));
                          //  Navigator.popAndPushNamed(context, 'login');
                        },
                      ),


                      ListTile(
                        leading: const Icon(Icons.logout_outlined,color: Color.fromRGBO(220, 95, 0, 1),),
                        title: const Text("Sign Out",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(220, 95, 0, 1))),
                        onTap: ()  async {
                          FirebaseAuth.instance.signOut();
                          await storage.delete(key: 'uid');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));

                        },
                      ),
                    ],
                  ),
                )
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),

              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.topRight,
                    //   end: Alignment.bottomRight,
                    //   stops: [0.0, 0.1, 0.5, 0.9],
                    //   colors: [
                    //     Color.fromRGBO(220, 95, 0, 1),
                    //     Color.fromRGBO(220, 95, 0, 1),
                    //     Colors.white,
                    //     Colors.white,
                    //   ],
                    // ),

                    color: Colors.white,
                  ),

                  child: Column(
                    children: [
                      Table(
                          columnWidths: {
                            0: FlexColumnWidth(5),
                            1: FlexColumnWidth(2),


                            //  2: FlexColumnWidth(4),
                          },
                          children: [
                            TableRow(
                                children: [
                                  Row(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(text: 'Hello, ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,),),
                                            TextSpan(
                                              text: name.toString()+'!',
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: const  Color.fromRGBO(220, 95, 0, 1)),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  Icon(Icons.menu_book,color: const  Color.fromRGBO(220, 95, 0, 1),size: 40,)

                                ]
                            ),

                          ]
                      ),


                      //  Text('Stranger,',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black26),),
                      Divider(
                          thickness: 1,
                          color: Color.fromRGBO(207, 10, 10, 1)
                      ),
                      TextScroll(
                        'This is the sample text for Flutter TextScrollkjadigaigiGIgdiBhjgHhgiGIdHGIHagAIDGIagadetr widget. ',
                        mode: TextScrollMode.endless,
                        // velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                        //  delayBefore: Duration(milliseconds: 500),
                        numberOfReps: 100,
                        //  pauseBetween: Duration(milliseconds: 50),
                        textAlign: TextAlign.right,
                        selectable: true,
                      ),
                      Divider(
                          thickness: 1,
                          color: Color.fromRGBO(207, 10, 10, 1)

                      ),
                      Stack(
                        children: [
                          Container(

                            child:
                            CarouselSlider.builder(


                              options: CarouselOptions(
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.9,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 5),
                                  height: 240






                              ),   itemCount:   snapshot.data!.docs.length,



                              itemBuilder: (BuildContext context, int index, int realIndex) {
                                final  product = snapshot.data!.docs[index];
                                return InkWell(
                                  onTap: (){

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            AdverDetails(product)));
                                  },
                                  child: Image.network(product.get('image',),fit: BoxFit.fill,width: 360,height: 200,),

                                      // Expanded(child: Row(
                                      //   children: [
                                      //     Padding(
                                      //       padding: const EdgeInsets.only(left: 60),
                                      //       child: Text(product.get('model'),style: TextStyle(fontSize: 20,decoration: TextDecoration.underline,fontStyle: FontStyle. italic,fontWeight: FontWeight.w500,color: Colors.white),),
                                      //     ),
                                      //   ],

                                );

                              }, ),

                          ),
                          Positioned(
                            right: 168,
                            bottom: 25,
                            child: AnimatedSmoothIndicator(
                                effect:  SlideEffect(
                                    spacing:  8.0,
                                    radius:  4.0,
                                    dotWidth:  9.0,
                                    dotHeight:  9.0,
                                    paintStyle:  PaintingStyle.stroke,
                                    strokeWidth:  1.5,
                                    dotColor:  Colors.white,
                                    activeDotColor:  Colors.white
                                ),
                                activeIndex:activeIndex,
                                count: snapshot.data!.docs.length,


                            ),
                          )
                        ],
                      ),


                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Branch("Science")));
                        },
                        child: Container(
                            height: 115,
                            width: 360,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(10),
                            //   color: Colors.white,
                            //   border: Border.all(color: const  Color.fromARGB(255,95 , 111, 148)),
                            //   boxShadow: [
                            //     const BoxShadow(color: const  Color.fromARGB(255,95 , 111, 148),
                            //         offset: const Offset(1, 1)),
                            //     const BoxShadow(color: const  Color.fromARGB(
                            //         255, 95, 111, 148),
                            //         offset: const Offset(0, 0),
                            //         blurRadius: 5,
                            //         spreadRadius: 0)
                            //   ],
                            // ),
                            child: Stack(children:
                            [
                              Positioned(
                                  top: 25,
                                  right: 23,

                                  child: Container(

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(color: const  Color.fromRGBO(220, 95, 0, 1)),
                                        boxShadow: [
                                          const BoxShadow(color: const  Color.fromRGBO(220, 95, 0, 1),
                                              offset: const Offset(1, 1)),
                                          const BoxShadow(color: const  Color.fromRGBO(220, 95, 0, 1),
                                              offset: const Offset(0, 0),
                                              blurRadius: 5,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('    Science    ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Color.fromRGBO(220, 95, 0, 1)),),
                                      ))),
                              Positioned(
                                  top:11,
                                  left: 19,
                                  child: Icon(Icons.science_outlined,color: Color.fromRGBO(220, 95, 0, 1),size: 80,)),
                              Icon(Icons.circle_outlined,color: Color.fromRGBO(220, 95, 0, 1),size: 115,),



                            ])),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Branch("Commerce")));
                        },
                        child: Container(
                            height: 115,
                            width: 360,

                            child: Stack(children:
                            [
                              Positioned(
                                  top: 25,
                                  left: 23,

                                  child: Container(

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(color: const  Color.fromRGBO(220, 95, 0, 1)),
                                        boxShadow: [
                                          const BoxShadow(color: const  Color.fromRGBO(220, 95, 0, 1),
                                              offset: const Offset(1, 1)),
                                          const BoxShadow(color: const  Color.fromRGBO(220, 95, 0, 1),
                                              offset: const Offset(0, 0),
                                              blurRadius: 5,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(' Commerce ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Color.fromRGBO(220, 95, 0, 1)),),
                                      ))),
                              Positioned(
                                  top:16,
                                  right: 29,
                                  child: Icon(Icons.woo_commerce_sharp,color: Color.fromRGBO(220, 95, 0, 1),size: 70,)),
                              Positioned(

                                  top:2,
                                  right: 5,
                                  child: Icon(Icons.circle_outlined,color: Color.fromRGBO(220, 95, 0, 1),size: 115,)),



                            ])),
                      ),
                      Container(
                          height: 115,
                          width: 360,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(10),
                          //   color: Colors.white,
                          //   border: Border.all(color: const  Color.fromARGB(255,95 , 111, 148)),
                          //   boxShadow: [
                          //     const BoxShadow(color: const  Color.fromARGB(255,95 , 111, 148),
                          //         offset: const Offset(1, 1)),
                          //     const BoxShadow(color: const  Color.fromARGB(
                          //         255, 95, 111, 148),
                          //         offset: const Offset(0, 0),
                          //         blurRadius: 5,
                          //         spreadRadius: 0)
                          //   ],
                          // ),
                          child: Stack(children:
                          [
                            Positioned(
                                top: 25,
                                right: 24,

                                child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(color: const  Color.fromRGBO(220, 95, 0, 1)),
                                      boxShadow: [
                                        const BoxShadow(color: const  Color.fromRGBO(220, 95, 0, 1),
                                            offset: const Offset(1, 1)),
                                        const BoxShadow(color: const  Color.fromRGBO(220, 95, 0, 1),
                                            offset: const Offset(0, 0),
                                            blurRadius: 5,
                                            spreadRadius: 0)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('    Arts          ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Color.fromRGBO(220, 95, 0, 1)),),
                                    ))),
                            Positioned(
                                top:25,
                                left: 22,
                                child: Icon(Icons.sports_martial_arts_rounded,color: Color.fromRGBO(220, 95, 0, 1),size: 65,)),
                            Icon(Icons.circle_outlined,color: Color.fromRGBO(220, 95, 0, 1),size: 115,),



                          ])),
                      Container(
                          height: 115,
                          width: 360,

                          child: Stack(children:
                          [
                            Positioned(
                                top: 25,
                                left: 23,

                                child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(color: const  Color.fromRGBO(220, 95, 0, 1)),
                                      boxShadow: [
                                        const BoxShadow(color: const  Color.fromRGBO(220, 95, 0, 1),
                                            offset: const Offset(1, 1)),
                                        const BoxShadow(color: const  Color.fromRGBO(220, 95, 0, 1),
                                            offset: const Offset(0, 0),
                                            blurRadius: 5,
                                            spreadRadius: 0)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('      Others    ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Color.fromRGBO(220, 95, 0, 1)),),
                                    ))),
                            Positioned(
                                top:26,
                                right: 32,
                                child: Icon(Icons.devices_other_sharp,color: Color.fromRGBO(220, 95, 0, 1),size: 55,)),
                            Positioned(

                                top:2,
                                right: 4,
                                child: Icon(Icons.circle_outlined,color: Color.fromRGBO(220, 95, 0, 1),size: 115,)),



                          ]))
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );

  }

}
