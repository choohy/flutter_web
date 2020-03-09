import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/leave_type_model.dart';
import '../../../../core/error/exception.dart';

abstract class LeaveTypeLocalDataSource {
  //Reads local json when there is no network connection.
  //Gets local leave description
  Future<LeaveTypeModel> getLeaveType(String pin);
  Future<void> setLeaveType(LeaveTypeModel leaveType);
  //Reads local json when there is no network connection.
  //Gets local leave types
  Future<LeaveTypeModel> getLeaveTypes();
}

class LeaveTypeLocalDataSourceImpl implements LeaveTypeLocalDataSource {
  final SharedPreferences sharedPreferences;

  LeaveTypeLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<LeaveTypeModel> getLeaveType(String pin) {
    final jsonString = sharedPreferences.getString(pin);
    if (jsonString != null)
      return Future.value(LeaveTypeModel.fromJson(json.decode(jsonString)));
    else
      throw CacheException();
  }

  @override
  Future<LeaveTypeModel> getLeaveTypes() {
    // TODO: implement getLeaveTypes
    throw UnimplementedError();
  }

  @override
  Future<void> setLeaveType(LeaveTypeModel leaveType) {
    return sharedPreferences.setString(leaveType.leaveType, json.encode(leaveType.toJson()));
  }
}
