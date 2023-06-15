part of 'MOHStaffLogin_bloc.dart';

abstract class MOHStaffLoginEvent extends Equatable {
  const MOHStaffLoginEvent();
  @override
  List<Object> get props => [];
}


//add data
class InsertMOHStaffData extends MOHStaffLoginEvent {
  final MOHStaffLoginModel mohStaffLoginModel;
  const InsertMOHStaffData(this.mohStaffLoginModel);
}