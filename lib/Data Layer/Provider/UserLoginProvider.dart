import '../Repository/loginDB.dart';

class UserLoginProvider
{
  final _userLoginProvider = LoginDB.instance;

  //login user
  Future<int> saveUserData(userLoginModel)
  {
    return _userLoginProvider.loginUser(userLoginModel);
  }

}