import 'package:flutter_me/core/util/number_input_converter.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:flutter_me/features/leave/domain/usecases/get_leave_description.dart';
import 'package:flutter_me/features/leave/domain/usecases/get_leave_types.dart';
import 'package:flutter_me/features/leave/presentation/bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLeaveType extends Mock implements GetLeaveType {}

class MockLeaveDescription extends Mock implements GetLeaveDescription {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  LeaveTypeBloc bloc;
  MockLeaveType mockLeaveType;
  MockLeaveDescription mockLeaveDescription;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockLeaveType = MockLeaveType();
    mockLeaveDescription = MockLeaveDescription();
    mockInputConverter = MockInputConverter();

    bloc = LeaveTypeBloc(
        leaveType: mockLeaveType,
        leaveDescription: mockLeaveDescription,
        inputConverter: mockInputConverter);
  });

  test('initialState should be empty', () async {
    expect(bloc.initialState, equals(Empty()));
  });

  group('GetLeaveType', () {
    // arrange pre-conditions
    final tLeaveTypeTitle = "ANNUAL LEAVE";
    final tLeaveTypeDescription = "Annual leave";
    final tLeaveType = LeaveType(
        leaveType: tLeaveTypeTitle, leaveDescription: tLeaveTypeDescription);
    test('Convert string', () async {
//      final tResult = Future.value(true);

      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Right(1));

      // act = perform the action
//      final result = classToTest.mentodToTest;
      bloc.add(GetLeaveType(tLeaveType));
      await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
      // assert the result

      //check method called
      verify(mockInputConverter.stringToUnsignedInteger("1"));

      //check actual matches expected end result
//      expect(bloc.initialState, equals(Empty()));
    });
    test('Input invalid', () async {
//      final tResult = Future.value(true);

      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Left(InvalidInputFailure()));

      // act = perform the action
//      final result = classToTest.mentodToTest;

      //check actual matches expected end result
      // assert the result

      final expectedList = [
        Empty(),
        Error(message: INVALID_INPUT_FAILURE_MESSAGE)
      ];
      expectLater(bloc.state, emitsInOrder(expectedList));

      bloc.add(GetLeaveType(tLeaveType));
      await untilCalled(mockInputConverter.stringToUnsignedInteger(any));


      //check method called
//      verify(mockInputConverter.stringToUnsignedInteger("1"));
    });
  });
}
