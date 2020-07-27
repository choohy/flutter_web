import 'package:equatable/equatable.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LeaveTypeEvent extends Equatable {
  final LeaveType leaveType;

  LeaveTypeEvent(this.leaveType);
//  LeaveTypeEvent();

//  @override
  List<Object> get props => [leaveType];
}

class GetLeaveType extends LeaveTypeEvent {
  GetLeaveType(LeaveType leaveType) : super(leaveType);
}