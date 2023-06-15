import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/AdminVaccinationModel.dart';
import '../../Data Layer/Provider/AdminVaccinationProvider.dart';

part 'AdminVaccination_event.dart';
part 'AdminVaccination_state.dart';

class AdminVaccinationBloc
    extends Bloc<AdminVaccinationEvent, AdminVaccinationState> {
  AdminVaccinationBloc() : super(AdminInitial()) {
    final AdminVaccinationProvider adminvaccinationProvider =
        AdminVaccinationProvider();

    //get all admin list
    on<GetAdminList>((event, emit) async {
      emit(AdminLoading());
      final listAdmin =
          await adminvaccinationProvider.getAllAdminlDataProvider();
      emit(IndexAdminLoad(listAdmin));
    });

    //insert admin
    on<InsertAdminData>((event, emit) async {
      await adminvaccinationProvider.saveAdminData(event.adminvaccinationModel);
    });

    //delete
    on<DeleteAdminData>((event, emit) async {
      await adminvaccinationProvider.deleteAdminData(event.adminId);
    });

    //get specific admin
    on<GetAdminData>((event, emit) async {
      emit(AdminLoading());
      final updateAdmin = await adminvaccinationProvider
          .getSpecificAdminDataProvider(event.adminId);
      emit(UpdateAdminLoad(updateAdmin));
    });

    //update
    on<UpdateAdminData>((event, emit) async {
      await adminvaccinationProvider
          .updateAdminDataProvider(event.adminvaccinationModel);
    });
  }
}
