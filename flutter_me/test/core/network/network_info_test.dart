import 'package:flutter_me/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnectionMocker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfo;
  MockDataConnectionMocker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionMocker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
  test(
    'should forward the call to DataConnectionChecker.hasConnection',
        () async {
      //arrange
      final tHasConnectionFuture = Future.value(true);

      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = networkInfo.isConnected;
      // Verify that the method has been called on the Repository
      verify(mockDataConnectionChecker.hasConnection);
      // Only the above method should be called and nothing more.
      expect(result, tHasConnectionFuture);
    }
  );
  });
}
