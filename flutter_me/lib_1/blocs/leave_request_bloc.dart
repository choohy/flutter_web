import 'package:flutter_me/models/leave_request_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LeaveRequestBloc {
  final _repository = Repository();
  final _leaveRequestFetcher = PublishSubject<LeaveRequestModel>();

  Observable<LeaveRequestModel> get allLeaveRequest => _leaveRequestFetcher.stream;

  fetchAllLeaveRequest() async {
    LeaveRequestModel leaveRequestModel = await _repository.fetchAllLeaveRequest();
    print('leaveRequestModel Found: '+leaveRequestModel.toString());
    _leaveRequestFetcher.sink.add(leaveRequestModel);
    print('leaveRequestModel: '+leaveRequestModel.toString());
  }

  dispose() {
    _leaveRequestFetcher.close();
  }
}

final bloc = LeaveRequestBloc();