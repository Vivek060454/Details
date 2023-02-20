// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../utils/database.dart';
//
// class Addrese extends StatefulWidget {
//   const Addrese({Key? key}) : super(key: key);
//
//   @override
//   State<Addrese> createState() => _AddreseState();
// }
//
// class _AddreseState extends State<Addrese> {
//   List<Map<String,dynamic>> _journals=[];
//   bool _isLoading = true;
//   void  _refreshJournals() async{
//     final data = await SQLHelper.getItems();
//     setState(() {
//       _journals=data;
//       _isLoading=false;
//     });
//   }
//   @override
//   void initState() {
//     _refreshJournals();
//     // TODO: implement initState
//     print("number of items${_journals.length}");
//     super.initState();
//   }
//   final TextEditingController _titleController= TextEditingController();
//   final TextEditingController _landmarkController =TextEditingController();
//   final TextEditingController _mobileController= TextEditingController();
//   final TextEditingController _addreseController =TextEditingController();
//   final TextEditingController _pincodeController= TextEditingController();
//
//   void _showform(int? id) async {
//     if(id!=null){
//       final existingJournal=_journals.firstWhere((element) => element["id"]==id);
//       _titleController.text=existingJournal['title'];
//  _landmarkController.text=existingJournal['landmark'];
//       _mobileController.text=existingJournal['mobile'];
//       _addreseController.text=existingJournal['addrese'];
//       _pincodeController.text=existingJournal['pincode'];
//
//     }
//   }
//   // Future<void> _addItem() async {
//   //   await SQLHelper.createItem(
//   //       _titleController.text, _landmarkController.text,_mobileController.text,_addreseController.text,_pincodeController.text);
//   //   _refreshJournals();
//   //
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hi'),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(
//           top: 15,
//           left: 15,
//           right: 15,
//           // this will prevent the soft keyboard from covering the text fields
//
//         ),
//         child:  Column(
//
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(hintText: 'Title'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextField(
//               controller: _landmarkController,
//               decoration: const InputDecoration(hintText: 'Description'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: _mobileController,
//               decoration: const InputDecoration(hintText: 'Title'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//
//             TextField(
//               controller: _addreseController,
//               decoration: const InputDecoration(hintText: 'Title'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//
//
//             TextField(
//               controller: _pincodeController,
//               decoration: const InputDecoration(hintText: 'Title'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 // Save new journal
//
//                  // await _addItem();
//
//
//
//                 // Clear the text fields
//                 _titleController.text = '';
//                 _landmarkController.text = '';
//                 _pincodeController.text = '';
//                 _addreseController.text = '';
//                 _mobileController.text = '';
//
//
//
//                 // Close the bottom sheet
//                 Navigator.of(context).pop();
//               },
//               child: Text('Create New' ),
//             )
//           ],
//         ),
//       ),
//
//     );
//   }
// }
