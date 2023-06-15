import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Data Layer/Model/MOHStaffVaccinationModel.dart';
import '../../Data Layer/Provider/MOHVaccinationProvider.dart';

part 'MOHStaffVaccination_event.dart';
part 'MOHStaffVaccination_state.dart';

class MOHStaffVaccinationBloc
    extends Bloc<MOHStaffVaccinationEvent, MOHStaffVaccinationState> {
  MOHStaffVaccinationBloc() : super(MOHStaffInitial()) {
    final MOHStaffVaccinationProvider mohstaffvaccinationProvider =
        MOHStaffVaccinationProvider();

    //get all MOH staff list
    on<GetMOHStaffList>((event, emit) async {
      emit(MOHStaffLoading());
      final listMOHStaff =
          await mohstaffvaccinationProvider.getAllMOHStafflDataProvider();
      emit(IndexMOHStaffLoad(listMOHStaff));
    });

    //insert MOH staff
    on<InsertMOHStaffData>((event, emit) async {
      await mohstaffvaccinationProvider
          .saveMOHStaffData(event.mohstaffvaccinationModel);
    });

    //delete MOH staff
    on<DeleteMOHStaffData>((event, emit) async {
      await mohstaffvaccinationProvider.deleteMOHStaffData(event.mohstaffId);
    });

    //get specific MOH staff
    on<GetMOHStaffData>((event, emit) async {
      emit(MOHStaffLoading());
      final updateMOHStaff = await mohstaffvaccinationProvider
          .getSpecificMOHStaffDataProvider(event.mohstaffId);
      emit(UpdateMOHStaffLoad(updateMOHStaff));
    });

    //update MOH staff
    on<UpdateMOHStaffData>((event, emit) async {
      await mohstaffvaccinationProvider
          .updateMOHStaffDataProvider(event.mohstaffvaccinationModel);
    });
  }
}
