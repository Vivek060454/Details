class NotesModel{
  final int? id;
  final String? name;
  final String? addrese;
  final String? landmark;
  final int? mobile;
  final int? pincode;
  NotesModel({this.id, this.name, this.addrese, this.landmark, this.mobile, this.pincode});
  NotesModel.fromMap(Map<String,dynamic> res):
  id=res['id'],
  name=res['name'],
  landmark=res['landmark'],
  mobile=res['mobile'],
  pincode=res['pincode'],
  addrese=res['addrese'];
  Map<String,Object?> toMap(){
    return {
      'id':id,
      'name':name,
      'landmark':landmark,
      ' mobile': mobile,
      'pincode':pincode,
      ' addrese': addrese

    };
  }
}