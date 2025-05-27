import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("change  is $change");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("close  is $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("create  is $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("the bloc   is $bloc  the error is $error ");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint("the bloc   is $bloc  the event  is $event ");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("the bloc   is $bloc  the Transition  is $transition ");
  }
}
