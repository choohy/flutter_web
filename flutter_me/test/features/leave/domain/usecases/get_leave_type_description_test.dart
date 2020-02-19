import 'package:dartz/dartz.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:flutter_me/features/leave/domain/repositories/leave_type_repository.dart';
import 'package:flutter_me/features/leave/domain/usecases/get_leave_description.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLeaveTypeRespository extends Mock implements LeaveTypeRepository {}

void main() {
  GetLeaveDescription usecase;
  MockLeaveTypeRespository mockLeaveTypeRespository;
  setUp(() {
    mockLeaveTypeRespository = MockLeaveTypeRespository();
    usecase = GetLeaveDescription(mockLeaveTypeRespository);
  });

  final tPin = "ANNUAL LEAVE";
  final tDescription = LeaveType(leaveType: "ANNUAL LEAVE", leaveDescription: "Annual Leave");

  test(
    'should get description for the leave type from the repository',
        () async {
      //arrange
      when(mockLeaveTypeRespository.getLeaveDescription(any))
          .thenAnswer((_) async => Right(tDescription));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(Params(leaveType: tPin));
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tDescription));
      // Verify that the method has been called on the Repository
      verify(mockLeaveTypeRespository.getLeaveDescription(tPin));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockLeaveTypeRespository);
    },
  );
}