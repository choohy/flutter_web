import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_me/core/util/number_input_converter.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:flutter_me/features/leave/domain/usecases/get_leave_description.dart';
import 'bloc.dart';

const String SERVER_FAILURE_MESSAGE = '100 Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive number or 0';

class LeaveTypeBloc extends Bloc<LeaveTypeEvent, LeaveTypeState> {
  final GetLeaveType getLeaveType;
  final GetLeaveDescription getLeaveDescription;
  final InputConverter inputConverter;

  LeaveTypeBloc(
      {@required GetLeaveType leaveType,
      @required GetLeaveDescription leaveDescription,
      @required this.inputConverter})
      : assert(leaveType != null),
        assert(leaveDescription != null),
        assert(inputConverter != null),
        getLeaveType = leaveType,
        getLeaveDescription = leaveDescription;

  @override
  LeaveTypeState get initialState => Empty();

  @override
  Stream<LeaveTypeState> mapEventToState(
    LeaveTypeEvent event,
  ) async* {
    if (event is GetLeaveType) {
      final inputEither = inputConverter.stringToUnsignedInteger("1.0q");
      yield* inputEither.fold((failure) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      }, (integer) => throw UnimplementedError());
    }

    inputConverter.stringToUnsignedInteger("1");
//      yield LoadingLeaveType();
//      final leaveType = await _fetchLeaveTypeFromFakeApi(event.leaveType);
//      yield LoadedLeaveType(leaveType);
  }
}

Future<LeaveType> _fetchLeaveTypeFromFakeApi(LeaveType leaveType) {
  return Future.delayed(Duration(seconds: 1), () {
    return LeaveType(leaveType: "ANNUAL", leaveDescription: "Annual Leave");
  });
}
