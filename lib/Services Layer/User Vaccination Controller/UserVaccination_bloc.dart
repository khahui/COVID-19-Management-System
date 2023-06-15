import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data Layer/Model/UserVaccinationModel.dart';
import '../../Data Layer/Provider/UserVaccinationProvider.dart';

part 'UserVaccination_event.dart';
part 'UserVaccination_state.dart';

class UserBloc extends Bloc<UserVaccinationEvent, UserVaccinationState> {
  UserBloc() : super(UserInitial()) {
    final UserVaccinationProvider uservaccinationProvider =
        UserVaccinationProvider();

    //get all user list
    on<GetUserList>((event, emit) async {
      emit(UserLoading());
      final listUser = await uservaccinationProvider.getAllUserlDataProvider();
      emit(IndexUserLoad(listUser));
    });

    //insert user
    on<InsertUserData>((event, emit) async {
      await uservaccinationProvider.saveUserData(event.uservaccinationModel);
    });

    //delete
    on<DeleteUserData>((event, emit) async {
      await uservaccinationProvider.deleteUserData(event.userId);
    });

    //get specific user
    on<GetUserData>((event, emit) async {
      emit(UserLoading());
      final updateUser = await uservaccinationProvider
          .getSpecificUserDataProvider(event.userId);
      emit(UpdateUserLoad(updateUser));
    });

    //delete
    on<UpdateUserData>((event, emit) async {
      await uservaccinationProvider
          .updateUserDataProvider(event.uservaccinationModel);
    });
  }
}
