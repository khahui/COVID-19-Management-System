import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:testaapril/Data%20Layer/Model/MOHStaffUserQuarantineRecordModel.dart';

import '../../Data Layer/Model/MOHStaffUserQuarantineRecordModel.dart';
import '../../Data Layer/Provider/MOHStaffUserQuarantineRecordProvider.dart';

part 'MOHStaffUserQuarantineRecord_event.dart';
part 'MOHStaffUserQuarantineRecord_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitial()) {
    final AdminProvider adminProvider = AdminProvider();

    //get all admin list
    on<GetAdminList>((event, emit) async {
      emit(AdminLoading());
      final listAdmin = await adminProvider.getAllAdminlDataProvider();
      emit(IndexAdminLoad(listAdmin!));
    });

    //insert admin
    on<InsertAdminData>((event, emit) async {
      await adminProvider.saveAdminData(event.adminModel);
    });

    //delete
    on<DeleteAdminData>((event, emit) async {
      await adminProvider.deleteAdminData(event.adminId);
    });

    //get specific admin
    on<GetAdminData>((event, emit) async {
      emit(AdminLoading());
      final updateAdmin =
          await adminProvider.getSpecificAdminDataProvider(event.adminId);
      emit(UpdateAdminLoad(updateAdmin));
    });

    //update
    on<UpdateAdminData>((event, emit) async {
      await adminProvider.updateAdminDataProvider(event.adminModel);
    });
  }
}
