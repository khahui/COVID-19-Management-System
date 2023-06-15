part of 'AdminLogin_bloc.dart';

abstract class AdminLoginState extends Equatable {
  const AdminLoginState();
  @override
  List<Object> get props => [];
}

class AdminLoginInitial extends AdminLoginState {}

class AdminLoginLoading extends AdminLoginState {}

//update user load
class UpdateAdminLoad extends AdminLoginState {
  final AdminLoginModel adminLoginModel;
  const UpdateAdminLoad(this.adminLoginModel);
}

//display list user Index
class IndexAdminLoad extends AdminLoginState {
  final List<AdminLoginModel> adminLoginModel;
  const IndexAdminLoad(this.adminLoginModel);
}

class UserError extends AdminLoginState {
  final String? message;
  const UserError(this.message);
}
