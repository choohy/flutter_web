import 'package:flutter_me/models/leave_history_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LeaveHistoryBloc {
  final _repository = Repository();
  final _leaveHistoryFetcher = PublishSubject<LeaveHistoryModel>();

  Observable<LeaveHistoryModel> get allLeaveHistory => _leaveHistoryFetcher.stream;

  fetchAllLeaveHistory() async {
    LeaveHistoryModel leaveHistoryModel = await _repository.fetchAllLeaveHistory();
    print('leaveHistoryModel Found: '+leaveHistoryModel.toString());
    _leaveHistoryFetcher.sink.add(leaveHistoryModel);
    print('leaveHistoryModel: '+leaveHistoryModel.toString());
  }

  dispose() {
    _leaveHistoryFetcher.close();
  }
}

final bloc = LeaveHistoryBloc();