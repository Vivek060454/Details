import 'package:equatable/equatable.dart';

import '../Usermodel.dart';

abstract class ProfileState extends Equatable{
  const ProfileState();
}
class ProfileInitiate extends ProfileState{
  @override
  List<Object?> get props =>[];
}
class ProfileLoading extends ProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProfileSuccess extends ProfileState{
final ProfileModel model;
ProfileSuccess(this.model);
  @override
  // TODO: implement props
  List<Object?> get props => [model];

}
class ProfileSError extends ProfileState{
  final String msg;
  ProfileSError(this.msg);
  @override
  // TODO: implement props
  List<Object?> get props => [msg];

}