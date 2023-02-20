import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:untitled15/bloc/app_events.dart';
import 'package:untitled15/bloc/app_state.dart';
import 'package:untitled15/respo/repositories.dart';

import '../Usermodel.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  final _service =WebServise();
  ProfileBloc():super(ProfileInitiate()){
    on<ButtonClickEvent>((event, emit) => _callApi(event,emit));
  }
  _callApi(ButtonClickEvent event,Emitter<ProfileState> emit){
   final response = _service.callProfileApi();
   if(response==null){
     emit(ProfileSError("Error"));
   }
   else{
     var body =jsonDecode(response.body);
     print(body);
     var data =ProfileModel.fromMap(response.body);
     print(data);
     emit(ProfileSuccess(data));
   }
  }
}
