import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
@immutable
abstract class ProfileEvent extends Equatable{
  const ProfileEvent();
}
class ButtonClickEvent extends ProfileEvent{
  @override
  List<Object?> get props =>[];
}
