import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/MOHStaffLoginModel.dart';
import '../../Data Layer/Provider/MOHStaffLoginProvider.dart';

part 'MOHStaffLogin_event.dart';
part 'MOHStaffLogin_state.dart';

class MOHStaffLoginBloc extends Bloc<MOHStaffLoginEvent, MOHStaffLoginState> {
  MOHStaffLoginBloc() : super(MOHStaffLoginInitial()) {
    final MOHStaffLoginProvider mohStaffLoginProvider = MOHStaffLoginProvider();

    //insert user
    on<InsertMOHStaffData>((event, emit) async {
      await mohStaffLoginProvider.saveMOHStaffData(event.mohStaffLoginModel);
    });
  }
}
