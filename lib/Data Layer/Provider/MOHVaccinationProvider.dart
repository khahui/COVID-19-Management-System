
import '../Model/MOHStaffVaccinationModel.dart';
import '../Repository/vaccinationDB.dart';

class MOHStaffVaccinationProvider {
  final _mohstaffvaccinationProvider = VaccinationDB.instance;

  //get all MOH staff
  Future<List<MOHStaffVaccinationModel>> getAllMOHStafflDataProvider() {
    return _mohstaffvaccinationProvider.getAllMOHStaffData();
  }

  //insert MOH staff data
  Future<int> saveMOHStaffData(mohstaffvaccinationModel) {
    return _mohstaffvaccinationProvider.addMOHStaff(mohstaffvaccinationModel);
  }

  //get specific MOH staff data
  Future<MOHStaffVaccinationModel> getSpecificMOHStaffDataProvider(int value) {
    return _mohstaffvaccinationProvider.getSpecificMOHStaffData(value);
  }

  //update MOH staf data
  Future<int> updateMOHStaffDataProvider(mohstaffvaccinationModel) {
    return _mohstaffvaccinationProvider
        .updateMOHStaff(mohstaffvaccinationModel);
  }

  //delete MOH staff data
  Future<int> deleteMOHStaffData(int value) {
    return _mohstaffvaccinationProvider.deleteMOHStaff(value);
  }
}
