part of 'MOHStaffLogin_bloc.dart';

abstract class MOHStaffLoginState extends Equatable {
  const MOHStaffLoginState();
  @override
  List<Object> get props => [];
}

class MOHStaffLoginInitial extends MOHStaffLoginState {}

class MOHStaffLoginLoading extends MOHStaffLoginState {}

//update user load
class UpdateMOHStaffLoad extends MOHStaffLoginState {
  final MOHStaffLoginModel mohStaffLoginModel;
  const UpdateMOHStaffLoad(this.mohStaffLoginModel);
}

//display list user Index
class IndexMOHStaffLoad extends MOHStaffLoginState {
  final List<MOHStaffLoginModel> mohStaffLoginModel;
  const IndexMOHStaffLoad(this.mohStaffLoginModel);
}

class UserError extends MOHStaffLoginState {
  final String? message;
  const UserError(this.message);
}