part of 'AdminVaccination_bloc.dart';

abstract class AdminVaccinationState extends Equatable {
  const AdminVaccinationState();
  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminVaccinationState {}

class AdminLoading extends AdminVaccinationState {}

//update admin load
class UpdateAdminLoad extends AdminVaccinationState {
  final AdminVaccinationModel adminvaccinationModel;
  const UpdateAdminLoad(this.adminvaccinationModel);
}

//display list admin Index
class IndexAdminLoad extends AdminVaccinationState {
  final List<AdminVaccinationModel> adminvaccinationModel;
  const IndexAdminLoad(this.adminvaccinationModel);
}

class AdminError extends AdminVaccinationState {
  final String? message;
  const AdminError(this.message);
}
