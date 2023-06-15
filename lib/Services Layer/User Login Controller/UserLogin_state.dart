part of 'UserLogin_bloc.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();
  @override
  List<Object> get props => [];
}

class UserLoginInitial extends UserLoginState {}

class UserLoginLoading extends UserLoginState {}

//update user load
class UpdateUserLoad extends UserLoginState {
  final UserLoginModel userLoginModel;
  const UpdateUserLoad(this.userLoginModel);
}

//display list user Index
class IndexUserLoad extends UserLoginState {
  final List<UserLoginModel> userLoginModel;
  const IndexUserLoad(this.userLoginModel);
}

class UserError extends UserLoginState {
  final String? message;
  const UserError(this.message);
}