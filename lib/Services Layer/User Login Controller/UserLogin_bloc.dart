import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/UserLoginModel.dart';
import '../../Data Layer/Provider/UserLoginProvider.dart';

part 'UserLogin_event.dart';
part 'UserLogin_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super(UserLoginInitial()) {
    final UserLoginProvider userLoginProvider = UserLoginProvider();

    //insert user
    on<InsertUserData>((event, emit) async {
      await userLoginProvider.saveUserData(event.userLoginModel);
    });

  }
}
