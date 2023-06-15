
import '../Model/AdminVaccinationModel.dart';
import '../Repository/vaccinationDB.dart';

class AdminVaccinationProvider {
  final _adminvaccinationProvider = VaccinationDB.instance;

  //get all admin
  Future<List<AdminVaccinationModel>> getAllAdminlDataProvider() {
    return _adminvaccinationProvider.getAllAdminData();
  }

  //insert admin data
  Future<int> saveAdminData(adminvaccinationModel) {
    return _adminvaccinationProvider.addAdmin(adminvaccinationModel);
  }

  //get specific admin data
  Future<AdminVaccinationModel> getSpecificAdminDataProvider(int value) {
    return _adminvaccinationProvider.getSpecificAdminData(value);
  }

  //update admin data
  Future<int> updateAdminDataProvider(adminvaccinationModel) {
    return _adminvaccinationProvider.updateAdmin(adminvaccinationModel);
  }

  //delete admin data
  Future<int> deleteAdminData(int value) {
    return _adminvaccinationProvider.deleteAdmin(value);
  }
}
