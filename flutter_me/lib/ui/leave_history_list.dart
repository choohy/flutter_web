//import 'package:flutter/material.dart';
//import 'package:flutter_me/Utility/Approval_Icon.dart';
//import 'package:flutter_me/Utility/text_formating.dart';
//import 'package:flutter_me/models/leave_history.dart';
//import 'package:flutter_me/blocs/leave_history.dart';
//
//class LeaveHistoryWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    bloc.fetchAllLeaveHistory();
//    return StreamBuilder(
//      stream: bloc.allLeaveHistory,
//      builder: (context, AsyncSnapshot<LeaveHistoryModel> snapshot) {
//        if (snapshot.hasError) {
//          print('no snapshot found');
//          return Text('Error: ${snapshot.error}');
//        }
//        switch (snapshot.connectionState) {
//          case ConnectionState.waiting:
//            {
//              print('loading...');
//              return Center(child: CircularProgressIndicator());
//            }
//          default:
//            if (snapshot == null) return Text('no data');
//
//            if (snapshot.hasData) {
//              print('snapshot found');
////              print('snapshot: $snapshot');
//              return LeaveHistoryList(
//                snapshot: snapshot,
//              );
//            }
//        }
//        return Container();
//      },
//    );
//  }
//}
//
//class LeaveHistoryList extends StatefulWidget {
//  final AsyncSnapshot<LeaveHistoryModel> snapshot;
//
//  const LeaveHistoryList({Key key, this.snapshot}) : super(key: key);
//
//  @override
//  _LeaveHistoryListState createState() => _LeaveHistoryListState();
//}
//
//class _LeaveHistoryListState extends State<LeaveHistoryList> {
//  AsyncSnapshot<LeaveHistoryModel> _snapshot;
//  List<LeaveHistory> _leaveHistoryModel;
//
//  @override
//  Widget build(BuildContext context) {
//    _snapshot = widget.snapshot;
//    print('Snapshot.data ${_snapshot.data.history}');
//    _leaveHistoryModel = _snapshot.data.history;
//    List<LeaveHistory> _leaveHistory =
//        _leaveHistoryModel.map((i) => i).toList();
//    List<Item> _leaveItems =
//        _leaveHistory.elementAt(0).items.map((i) => i).toList();
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Expanded(
//          child: ListView.builder(
//            scrollDirection: Axis.vertical,
//            shrinkWrap: true,
//            itemCount: _leaveItems.length,
//            itemBuilder: (BuildContext context, int index) {
//              return ListTile(
//                title: _buildTile(
//                  index,
//                  _leaveItems[index],
//                ),
//              );
//            },
//          ),
//        ),
//      ],
//    );
//  }
//
//  Widget _buildTile(int index, Item item) {
//    return Card(
//      elevation: 2,
//      child: Container(
//        height: 80.0,
//        width: MediaQuery.of(context).size.width,
//        child: Column(
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                //Left Container
//                Container(
//                    margin: const EdgeInsets.all(15.0),
//                    alignment: Alignment(-1.0, 0.0),
////                  height: MediaQuery.of(context).size.height / 7,
//                    width: MediaQuery.of(context).size.width / 2.5,
//                    child:
//                    _left(item.detail.type.pinNm,
//                        DurationDateString(
//                            startDateString: item.detail.fromDate,
//                            endDateString: item.detail.toDate,
//                            format: "yyyy-MM-dd"
//                        ).toString()
////                        item.detail.fromDate + " to " + item.detail.toDate)
//                        )
//                ),
//                //Right Container
//                Container(
//                    margin: const EdgeInsets.all(15.0),
//                    alignment: Alignment(1.0, 0.0),
////                  height: MediaQuery.of(context).size.height / 7,
//                    width: MediaQuery.of(context).size.width / 2.9,
//                    child: _right(
//                      DurationString(
//                        days: item.duration.days,
//                        hours: item.duration.hours
//                      ).toString(),
////                        item.duration.days +
////                            " days, " +
////                            item.duration.hours +
////                            " hours",
//                         item.status)
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget _left(String lineOne, String lineTwo) {
//    return Column(
//      children: <Widget>[
//        Container(
//          alignment: Alignment(-1.0, 0.0),
//          child: Text(
//            lineOne,
//            style: TextStyle(
//              color: Color(0xff115599),
//            ),
//          ),
//        ),
//        Container(
//          alignment: Alignment(-1.0, 0.0),
//          child: Text(
//            lineTwo,
//            style: TextStyle(
//              color: Color(0xff999999),
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
//  Widget _right(String top, String bottom) {
//    return Column(
//      children: <Widget>[
//        Container(
//          alignment: Alignment(1.0, 0.0),
//          child: Text(
//            top,
//            style: TextStyle(
//              color: Colors.blueGrey,
//            ),
//          ),
//        ),
//        Container(
//          alignment: Alignment(1.0, 0.0),
//          child: ApprovalIcon(
//            status: bottom,
//          ),
//        ),
//      ],
//    );
////    return Text(top + bottom);
//  }
//}
