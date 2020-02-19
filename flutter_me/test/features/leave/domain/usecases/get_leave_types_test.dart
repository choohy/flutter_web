import 'package:dartz/dartz.dart';
import 'package:flutter_me/core/usercases/usecase.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:flutter_me/features/leave/domain/repositories/leave_type_repository.dart';
import 'package:flutter_me/features/leave/domain/usecases/get_leave_types.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLeaveTypeRespository extends Mock implements LeaveTypeRepository {}

void main() {
  GetLeaveTypes usecase;
  MockLeaveTypeRespository mockLeaveTypeRespository;
  setUp(() {
    mockLeaveTypeRespository = MockLeaveTypeRespository();
    usecase = GetLeaveTypes(mockLeaveTypeRespository);
  });

  final tLeaveTypes = new List<LeaveType>();
  tLeaveTypes.add(LeaveType(leaveType: "ANNUAL LEAVE",leaveDescription: "Annual leave"));
      tLeaveTypes.add(LeaveType(leaveType: "CARERS LEAVE",leaveDescription: "Carer's leave"));
  tLeaveTypes.add(LeaveType(leaveType: "CARERS WITHOUT PAY",leaveDescription: "Carer's leave w/o pay"));

  test(
    'should get list of leave type descriptions from the repository',
    () async {
      //arrange
      when(mockLeaveTypeRespository.getLeaveTypes())
          .thenAnswer((_) async => Right(tLeaveTypes));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(NoParams());
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tLeaveTypes));
      // Verify that the method has been called on the Repository
      verify(mockLeaveTypeRespository.getLeaveTypes());
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockLeaveTypeRespository);
    },
  );
}
