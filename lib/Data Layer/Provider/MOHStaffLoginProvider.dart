import '../Repository/loginDB.dart';

class MOHStaffLoginProvider
{
  final _mohStaffLoginProvider = LoginDB.instance;

  //login user
  Future<int> saveMOHStaffData(mohStaffLoginModel)
  {
    return _mohStaffLoginProvider.loginMOHStaff(mohStaffLoginModel);
  }



}