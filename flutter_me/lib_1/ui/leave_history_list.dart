import 'package:flutter/material.dart';
import '../Utility/Approval_Icon.dart';
import '../Utility/text_formating.dart';
import '../Utility/text_tile.dart';
import '../models/leave_history_model.dart';
import '../blocs/leave_history_bloc.dart';

class LeaveHistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllLeaveHistory();
    return StreamBuilder(
      stream: bloc.allLeaveHistory,
      builder: (context, AsyncSnapshot<LeaveHistoryModel> snapshot) {
        if (snapshot.hasError) {
          print('no snapshot found');
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              print('loading...');
              return Center(child: CircularProgressIndicator());
            }
          default:
            if (snapshot == null) return Text('no data');

            if (snapshot.hasData) {
              print('snapshot found');
//              print('snapshot: $snapshot');
              return LeaveHistoryList(
                snapshot: snapshot,
              );
            }
        }
        return Container();
      },
    );
  }
}

class LeaveHistoryList extends StatefulWidget {
  final AsyncSnapshot<LeaveHistoryModel> snapshot;

  const LeaveHistoryList({Key key, this.snapshot}) : super(key: key);

  @override
  _LeaveHistoryListState createState() => _LeaveHistoryListState();
}

class _LeaveHistoryListState extends State<LeaveHistoryList> {
  AsyncSnapshot<LeaveHistoryModel> _snapshot;
  List<LeaveHistory> _leaveHistoryModel;

  @override
  Widget build(BuildContext context) {
    _snapshot = widget.snapshot;
    print('Snapshot.data ${_snapshot.data.history}');
    _leaveHistoryModel = _snapshot.data.history;
    List<LeaveHistory> _leaveHistory =
        _leaveHistoryModel.map((i) => i).toList();
    List<Item> _leaveItems =
        _leaveHistory.elementAt(0).items.map((i) => i).toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _leaveItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: _buildTile(
                  index,
                  _leaveItems[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTile(int index, Item item) {
    return Card(
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.all(15.0),
//        height: 80.0,
//        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextTile(
                    lineOne: item.detail.type.pinNm,
                    lineTwo: DurationDateString(
                            startDateString: item.detail.fromDate,
                            endDateString: item.detail.toDate,
                            format: "yyyy-MM-dd")
                        .toString(),
                    lineThree: "",
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: _right(
                        DurationString(
                                days: item.duration.days,
                                hours: item.duration.hours)
                            .toString(),
                        item.status)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _right(String top, String bottom) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment(1.0, 0.0),
          child: Text(
            top,
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
        Container(
          alignment: Alignment(1.0, 0.0),
          child: ApprovalIcon(
            status: bottom,
          ),
        ),
      ],
    );
//    return Text(top + bottom);
  }
}
