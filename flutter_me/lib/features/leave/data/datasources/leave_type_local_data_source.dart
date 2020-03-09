import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';

import '../models/leave_type_model.dart';

abstract class LeaveTypeLocalDataSource {
  //Reads local json when there is no network connection.
  //Gets local leave description
  Future<LeaveTypeModel> setLeaveType(LeaveType leaveType);
  Future<LeaveTypeModel> getLeaveType();
  //Reads local json when there is no network connection.
  //Gets local leave types
  Future<LeaveTypeModel> getLeaveTypes();
}