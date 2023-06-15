part of 'UserVaccination_bloc.dart';

abstract class UserVaccinationEvent extends Equatable {
  const UserVaccinationEvent();
  @override
  List<Object> get props => [];
}

//get list of user data
class GetUserList extends UserVaccinationEvent {}

//add data
class InsertUserData extends UserVaccinationEvent {
  final UserVaccinationModel uservaccinationModel;
  const InsertUserData(this.uservaccinationModel);
}

//delete user data
class DeleteUserData extends UserVaccinationEvent {
  final int userId;
  const DeleteUserData(this.userId);
}

//get specific user data
class GetUserData extends UserVaccinationEvent {
  final int userId;
  const GetUserData(this.userId);
}

//update user data
class UpdateUserData extends UserVaccinationEvent {
  final UserVaccinationModel uservaccinationModel;
  const UpdateUserData(this.uservaccinationModel);
}
