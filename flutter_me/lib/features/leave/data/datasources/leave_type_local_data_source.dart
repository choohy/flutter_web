import '../models/leave_type_model.dart';

abstract class LeaveTypeLocalDataSource {
  //Reads local json when there is no network connection.
  //Gets local leave description
  Future<LeaveTypeModel> setLeaveDescription(String leaveType);
  Future<LeaveTypeModel> getLeaveDescription(String leaveType);
  //Reads local json when there is no network connection.
  //Gets local leave types
  Future<LeaveTypeModel> getLeaveTypes();
}