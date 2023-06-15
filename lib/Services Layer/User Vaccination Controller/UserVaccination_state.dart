part of 'UserVaccination_bloc.dart';

abstract class UserVaccinationState extends Equatable {
  const UserVaccinationState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserVaccinationState {}

class UserLoading extends UserVaccinationState {}

//update user load
class UpdateUserLoad extends UserVaccinationState {
  final UserVaccinationModel uservaccinationModel;
  const UpdateUserLoad(this.uservaccinationModel);
}

//display list user Index
class IndexUserLoad extends UserVaccinationState {
  final List<UserVaccinationModel> uservaccinationModel;
  const IndexUserLoad(this.uservaccinationModel);
}

class UserError extends UserVaccinationState {
  final String? message;
  const UserError(this.message);
}
