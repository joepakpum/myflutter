import 'package:cmflutter0/src/app.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEventAdd>((event, emit) async {
      // Call Api / Execute Something
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(count: state.count + 1));
    });
    on<LoginEventRemove>((event, emit) {
      // Call Api / Execute Something
      emit(state.copyWith(count: state.count - 1));
    });
    on<LoginEventLogin>((event, emit) {
      // Call Api / Execute Something
      if (event.payload.username == "admin" &&
          event.payload.password == "1234") {
        emit(state.copyWith(isAuthened: true));
        if (navigatorState.currentContext != null) {
          Navigator.pushReplacementNamed(
              navigatorState.currentContext!, AppRoute.home);
        }
      } else {
        emit(state.copyWith(isAuthened: false));
      }
    });
  }
}
