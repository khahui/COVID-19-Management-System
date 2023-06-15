part of 'AdminVaccination_bloc.dart';

abstract class AdminVaccinationEvent extends Equatable {
  const AdminVaccinationEvent();
  @override
  List<Object> get props => [];
}

//get list of admin data
class GetAdminList extends AdminVaccinationEvent {}

//add data
class InsertAdminData extends AdminVaccinationEvent {
  final AdminVaccinationModel adminvaccinationModel;
  const InsertAdminData(this.adminvaccinationModel);
}

//delete admin data
class DeleteAdminData extends AdminVaccinationEvent {
  final int adminId;
  const DeleteAdminData(this.adminId);
}

//get specific admin data
class GetAdminData extends AdminVaccinationEvent {
  final int adminId;
  const GetAdminData(this.adminId);
}

//update admin data
class UpdateAdminData extends AdminVaccinationEvent {
  final AdminVaccinationModel adminvaccinationModel;
  const UpdateAdminData(this.adminvaccinationModel);
}
