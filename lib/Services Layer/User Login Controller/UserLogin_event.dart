part of 'UserLogin_bloc.dart';

abstract class UserLoginEvent extends Equatable {
  const UserLoginEvent();
  @override
  List<Object> get props => [];
}
// //get list of user data
// class GetUserList extends UserEvent {}

//add data
class InsertUserData extends UserLoginEvent {
  final UserLoginModel userLoginModel;
  const InsertUserData(this.userLoginModel);
}
