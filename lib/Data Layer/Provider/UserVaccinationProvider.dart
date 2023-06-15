import '../Model/UserVaccinationModel.dart';
import '../Repository/vaccinationDB.dart';

class UserVaccinationProvider {
  final _uservaccinationProvider = VaccinationDB.instance;

  //get all user data
  Future<List<UserVaccinationModel>> getAllUserlDataProvider() {
    return _uservaccinationProvider.getAllUserData();
  }

  //insert user data
  Future<int> saveUserData(userVaccinationModel) {
    return _uservaccinationProvider.addUser(userVaccinationModel);
  }

  //get specific user data
  Future<UserVaccinationModel> getSpecificUserDataProvider(int value) {
    return _uservaccinationProvider.getSpecificUserData(value);
  }

  //update user data
  Future<int> updateUserDataProvider(userVaccinationModel) {
    return _uservaccinationProvider.updateUser(userVaccinationModel);
  }

  //delete user data
  Future<int> deleteUserData(int value) {
    return _uservaccinationProvider.deleteUser(value);
  }
}
