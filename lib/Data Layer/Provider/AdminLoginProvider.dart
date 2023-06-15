import '../Repository/loginDB.dart';

class AdminLoginProvider
{
  final _adminLoginProvider = LoginDB.instance;

  //login admin
  Future<int> saveAdminData(adminLoginModel)
  {
    return _adminLoginProvider.loginAdmin(adminLoginModel);
  }

}