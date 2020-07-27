import 'dart:async' show Future;
//import 'package:flutter_me/models/help.dart';
import '../models/leave_history_model.dart';
import '../models/leave_request_model.dart';

//import '../models/leave_type.dart';
//import 'help_provider.dart';
//import 'leave_balance_provider.dart';
import 'leave_history_provider.dart';
import 'leave_request_provider.dart';
//import 'leave_type_provider.dart';
//import 'leave_list_provider.dart';
//import 'package:flutter_me/models/leave_list_model.dart';

class Repository {

//  final leaveTypeApiProvider = LeaveTypeApiProvider();

//  Future<LeaveTypeModel> fetchAllLeaveTypes() => leaveTypeApiProvider.fetchLeaveTypes();

//  final leaveListApiProvider = LeaveListApiProvider();

//  Future<LeaveListModel> fetchAllLeaveList() => leaveListApiProvider.fetchLeaveList();

//  final leaveBalanceApiProvider = LeaveBalanceApiProvider();

//  Future<LeaveBalancesModel> fetchAllBalances() => leaveBalanceApiProvider.fetchLeaveBalances();

//  final leaveHistoryApiProvider = LeaveHistoryApiProvider();

//  Future<LeaveHistoryModel> fetchAllLeaveHistory() => leaveHistoryApiProvider.fetchLeaveHistory();

  final leaveRequestApiProvider = LeaveRequestApiProvider();

  Future<LeaveRequestModel> fetchAllLeaveRequest() => leaveRequestApiProvider.fetchLeaveRequest();

//  final helpApiProvider = HelpApiProvider();

//  Future<HelpModel> fetchAllHelp() => helpApiProvider.fetchHelp();
}