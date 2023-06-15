part of 'MOHStaffVaccination_bloc.dart';

abstract class MOHStaffVaccinationState extends Equatable {
  const MOHStaffVaccinationState();
  @override
  List<Object> get props => [];
}

class MOHStaffInitial extends MOHStaffVaccinationState {}

class MOHStaffLoading extends MOHStaffVaccinationState {}

//update MOH Staff load
class UpdateMOHStaffLoad extends MOHStaffVaccinationState {
  final MOHStaffVaccinationModel mohstaffModel;
  const UpdateMOHStaffLoad(this.mohstaffModel);
}

//display list MOH Staff Index
class IndexMOHStaffLoad extends MOHStaffVaccinationState {
  final List<MOHStaffVaccinationModel> mohstaffvaccinationModel;
  const IndexMOHStaffLoad(this.mohstaffvaccinationModel);
}

class MOHStaffError extends MOHStaffVaccinationState {
  final String? message;
  const MOHStaffError(this.message);
}
