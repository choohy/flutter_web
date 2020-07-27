import 'package:equatable/equatable.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LeaveTypeState extends Equatable {
  @override
  List<Object> get props => [];

}

class Empty extends LeaveTypeState {}
class Loading extends LeaveTypeState {}
class Loaded extends LeaveTypeState {
  final LeaveType leaveType;
  Loaded({this.leaveType});
  @override
  List<Object> get props => [leaveType];
}

class Error extends LeaveTypeState {
  final String message;
  Error({this.message});
  @override
  List<Object> get props => [message];
}

//class InitialLeaveTypeState extends LeaveTypeState {
////  InitialLeaveTypeState(LeaveType leaveType) : super(leaveType);
//}
//
//class LoadingLeaveType extends LeaveTypeState {
////  LoadingLeaveType(LeaveType leaveType) : super(leaveType);
//}
//
//class LoadedLeaveType extends LeaveTypeState {
//  final LeaveType _leaveType;
//  LoadedLeaveType(this._leaveType);
//
//  @override
//  List<Object> get props => [_leaveType];
//
//  LeaveType get leaveType => _leaveType;
//}