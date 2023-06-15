import '../Model/AdminInformationModel.dart';
import '../Repository/informationDB.dart';

class AdminProvider {
  final _adminProvider = InformationDB.instance;

  //get all admin
  Future<List<AdminModel>> getAllAdminlDataProvider() {
    return _adminProvider.getAllAdminData();
  }

  //insert admin data
  Future<int> saveAdminData(adminModel) {
    return _adminProvider.addAdmin(adminModel);
  }

  //get specific admin data
  Future<AdminModel> getSpecificAdminDataProvider(int value) {
    return _adminProvider.getSpecificAdminData(value);
  }

  //update admin data
  Future<int> updateAdminDataProvider(adminModel) {
    return _adminProvider.updateAdmin(adminModel);
  }

  //delete admin data
  Future<int> deleteAdminData(int value) {
    return _adminProvider.deleteAdmin(value);
  }
}
