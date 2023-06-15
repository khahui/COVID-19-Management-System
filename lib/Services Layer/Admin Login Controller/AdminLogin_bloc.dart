import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/AdminLoginModel.dart';
import '../../Data Layer/Provider/AdminLoginProvider.dart';

part 'AdminLogin_event.dart';
part 'AdminLogin_state.dart';

class AdminLoginBloc extends Bloc<AdminLoginEvent, AdminLoginState> {
  AdminLoginBloc() : super(AdminLoginInitial()) {
    final AdminLoginProvider adminLoginProvider = AdminLoginProvider();

    //insert user
    on<InsertAdminData>((event, emit) async {
      await adminLoginProvider.saveAdminData(event.adminLoginModel);
    });

  }
}
