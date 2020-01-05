import 'leave_form_types_model.dart';

class LeaveListModel {
  static String region = 'AUS';
//  static String employeeType = 'Full-Time';
  LeaveFormTypesByEmployeeType employeeLeaveList = LeaveFormTypesByEmployeeType();
  LeaveFormTypes leaveTypes = LeaveFormTypes();
  List<String> leaveTypeTitles = [];

  LeaveListModel({
    this.employeeLeaveList,
    this.leaveTypes,
    this.leaveTypeTitles
  });

  factory LeaveListModel.fromJson(Map<String, dynamic> parsedJson) {
//    print('LeaveHistoryModel parsedJson: $parsedJson');
    var regionFromJson = parsedJson['region'];
    var country = regionFromJson[region] as Map<String, dynamic>;
    var leaveTypes = country['leaveFormTypes'];
    var leaveEmployeeTypes = country['leaveFormTypesByEmployeeType'];
    var leaveEmployeePins = leaveEmployeeTypes.getFullTimeEmployeeTypes();
    List<String> countryLeaveTypeTitles = leaveEmployeePins.map((i) => leaveTypes(i));
    return LeaveListModel(
//        employeeLeaveList:leaveEmployeeTypes,
//        leaveTypes: leaveTypes,
        leaveTypeTitles: countryLeaveTypeTitles
    );
  }

  List<String> get getLeaveTypeTitles => leaveTypeTitles;
}