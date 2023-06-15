part of 'MOHStaffVaccination_bloc.dart';

abstract class MOHStaffVaccinationEvent extends Equatable {
  const MOHStaffVaccinationEvent();
  @override
  List<Object> get props => [];
}

//get list of MOH staff data
class GetMOHStaffList extends MOHStaffVaccinationEvent {}

//add MOH staff data
class InsertMOHStaffData extends MOHStaffVaccinationEvent {
  final MOHStaffVaccinationModel mohstaffvaccinationModel;
  const InsertMOHStaffData(this.mohstaffvaccinationModel);
}

//delete MOH staff data
class DeleteMOHStaffData extends MOHStaffVaccinationEvent {
  final int mohstaffId;
  const DeleteMOHStaffData(this.mohstaffId);
}

//get specific MOH staff data
class GetMOHStaffData extends MOHStaffVaccinationEvent {
  final int mohstaffId;
  const GetMOHStaffData(this.mohstaffId);
}

//update MOH staff data
class UpdateMOHStaffData extends MOHStaffVaccinationEvent {
  final MOHStaffVaccinationModel mohstaffvaccinationModel;
  const UpdateMOHStaffData(this.mohstaffvaccinationModel);
}
