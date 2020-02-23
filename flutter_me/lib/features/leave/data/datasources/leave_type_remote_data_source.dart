import '../models/leave_type_model.dart';

abstract class LeaveTypeRemoteDataSource {
  //Calls the XX end point
  //Throws a [ServerException] for all error codes.
  Future<LeaveTypeModel> getLeaveDescription(String leaveType);
  //Calls the XX end point
  //Throws a [ServerException] for all error codes.
  Future<LeaveTypeModel> getLeaveTypes();
}