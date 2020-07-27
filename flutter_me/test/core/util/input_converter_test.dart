
import 'package:dartz/dartz.dart';
import 'package:flutter_me/core/util/number_input_converter.dart';
//import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

//class MockClass extends Mock implements ClassToMock {}

void main() {
//  ClassToTest classToTest;
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
//    classToTest = ClassToTestConstructor(parameters);
  });

  group('stringToUnsignedInt', () {
    test('should return an integer when the String represents an unsigned integer', () async {
      // arrange pre-conditions
      final str = '123';

//      when(mockClass.mockMethod)
//          .thenAnswer((_) => tResult);

      // act = perform the action
      final result = inputConverter.stringToUnsignedInteger(str);

      // assert the result

      //check method called
//      verify(mockClass.mockMentod);

      //check actual matches expected end result
      expect(result, Right(123));
    });
    test('should return a Failure when the String is not an integer', () async {
      // arrange pre-conditions
      final str = '1.0';

//      when(mockClass.mockMethod)
//          .thenAnswer((_) => tResult);

      // act = perform the action
      final result = inputConverter.stringToUnsignedInteger(str);

      // assert the result

      //check method called
//      verify(mockClass.mockMentod);

      //check actual matches expected end result
      expect(result, Left(InvalidInputFailure()));
    });
    test('should return a Failure when the String is a negative integer', () async {
      // arrange pre-conditions
      final str = '-123';

//      when(mockClass.mockMethod)
//          .thenAnswer((_) => tResult);

      // act = perform the action
      final result = inputConverter.stringToUnsignedInteger(str);

      // assert the result

      //check method called
//      verify(mockClass.mockMentod);

      //check actual matches expected end result
      expect(result, Left(InvalidInputFailure()));
    });
  });
}