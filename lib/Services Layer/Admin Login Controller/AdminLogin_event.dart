part of 'AdminLogin_bloc.dart';

abstract class AdminLoginEvent extends Equatable {
  const AdminLoginEvent();
  @override
  List<Object> get props => [];
}


//add data
class InsertAdminData extends AdminLoginEvent {
  final AdminLoginModel adminLoginModel;
  const InsertAdminData(this.adminLoginModel);
}
