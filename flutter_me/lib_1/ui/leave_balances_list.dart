//import 'package:flutter/material.dart';
//import 'package:flutter_me/Utility/Approval_Icon.dart';
//import 'package:flutter_me/Utility/text_formating.dart';
//import 'package:flutter_me/Utility/text_tile.dart';
//import 'package:flutter_me/models/leave_history_model.dart';
//import 'package:flutter_me/blocs/leave_history_bloc.dart';
//
//class LeaveBalancesWidget extends StatelessWidget {
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
//    _leaveHistoryModel.map((i) => i).toList();
//    List<Item> _leaveItems =
//    _leaveHistory.elementAt(0).items.map((i) => i).toList();
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
//      elevation: 3,
//      child: Container(
//        margin: const EdgeInsets.all(15.0),
////        height: 80.0,
////        width: MediaQuery.of(context).size.width,
//        child: Column(
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: TextTile(
//                    lineOne: item.detail.type.pinNm,
//                    lineTwo: DurationDateString(
//                        startDateString: item.detail.fromDate,
//                        endDateString: item.detail.toDate,
//                        format: "yyyy-MM-dd")
//                        .toString(),
//                    lineThree: "",
//                  ),
//                ),
//                Expanded(
//                    flex: 1,
//                    child: _right(
//                        DurationString(
//                            days: item.duration.days,
//                            hours: item.duration.hours)
//                            .toString(),
//                        item.status)),
//              ],
//            ),
//          ],
//        ),
//      ),
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
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////import 'package:flutter/material.dart';
////import 'package:flutter_me/Navigation/request_button.dart';
////import 'package:flutter_me/models/leave_request_model.dart';
////import 'package:flutter_me/models/leave_form_types_model.dart';
////import 'package:flutter_me/models/leave_list_model.dart';
////
//////import '../blocs/leave_balances.dart';
////import '../blocs/leave_type.dart';
////import '../models/leave_type.dart';
////
////class LeaveBalancesWidget extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    bloc.fetchAllLeaveTypes();
////    return StreamBuilder(
////      stream: bloc.allLeaveTypes,
////      builder: (context, AsyncSnapshot<LeaveListModel> snapshot) {
////        if (snapshot.hasError) {
////          print('no snapshot found');
////          return Text('Error: ${snapshot.error}');
////        }
////        switch (snapshot.connectionState) {
////          case ConnectionState.waiting:
////            {
////              print('loading...');
////              return Center(child: CircularProgressIndicator());
////            }
////          default:
////            if (snapshot == null) return Text('no data');
////
////            if (snapshot.hasData) {
////              print('snapshot found');
//////              print('snapshot: $snapshot');
////              return BalanceList(
////                snapshot: snapshot,
////              );
////            }
////        }
////        return Container();
////      },
////    );
////  }
////}
////
////class BalanceList extends StatefulWidget {
////  final AsyncSnapshot<LeaveListModel> snapshot;
////
////  const BalanceList({Key key, this.snapshot}) : super(key: key);
////
////  @override
////  _BalanceListState createState() => _BalanceListState();
////}
////
////class _BalanceListState extends State<BalanceList> {
////  AsyncSnapshot<LeaveListModel> _snapshot;
////  List<String> _balancesModel;
////
////  @override
////  Widget build(BuildContext context) {
////    _snapshot = widget.snapshot;
////    print('Snapshot.data ${_snapshot.data.leaveTypeTitles}');
////    _balancesModel = _snapshot.data.leaveTypeTitles;
////    List<String> _listItems = _balancesModel;
//////    _balancesModel.map((i) => i.leaveType.pinNm).toList();
//////    print('listItems: $_listItems');
////    List<String> _additionalInfo = ['hello'];
//////    _balancesModel.map((i) => "${i.days} days, ${i.hours} hours").toList();
//////    print('additionalInfo: $_additionalInfo');
////
////    return Column(
////      mainAxisSize: MainAxisSize.min,
////      children: <Widget>[
////        Expanded(
////          child: ListView.builder(
////            scrollDirection: Axis.vertical,
////            shrinkWrap: true,
////            itemCount: _listItems.length,
////            itemBuilder: (BuildContext context, int index) {
//////              return Text('list tile');
////              return ListTile(
////                title: _buildTile(
////                  _listItems[index],
//////                    Text('left info'), Text('right info')
////                  _textTile(
////                    _listItems[index],
////                    _additionalInfo[index],
////                    //'',
////                  ),
////                  RequestButton(
////                    leaveForm: LeaveForm(),
////                    leaveTypeIndex: index,
////                  ),
//////                  _requestButton(index),
////                ),
////              );
////            },
////          ),
////        ),
////      ],
////    );
////  }
////
////  Widget _buildTile(String title, Widget left, Widget right) {
////    return Card(
////      elevation: 4,
////      child: Container(
////        height: 80.0,
////        width: MediaQuery
////            .of(context)
////            .size
////            .width,
////        child: Column(
////          children: <Widget>[
////            Row(
////              children: <Widget>[
////                Container(
////                  margin: const EdgeInsets.all(15.0),
////                  alignment: Alignment(-1.0, 0.0),
//////                  height: MediaQuery.of(context).size.height / 7,
////                  width: MediaQuery
////                      .of(context)
////                      .size
////                      .width / 2.5,
//////                  child: Text('left'),
////                  child: left,
////                ),
////                Container(
////                  margin: const EdgeInsets.all(15.0),
////                  alignment: Alignment(1.0, 0.0),
//////                  height: MediaQuery.of(context).size.height / 7,
////                  width: MediaQuery
////                      .of(context)
////                      .size
////                      .width / 2.9,
////                  child: right,
////                ),
////              ],
////            ),
////          ],
////        ),
////      ),
////    );
////  }
////
////  Widget _textTile(String lineOne, String lineTwo) {
////    return Column(
////      children: <Widget>[
////        Container(
////          alignment: Alignment(-1.0, 0.0),
////          child: Text(
////            lineOne,
////            style: TextStyle(
////              color: Color(0xff115599),
////            ),
////          ),
////        ),
////        Container(
////          alignment: Alignment(-1.0, 0.0),
////          child: Text(
////            lineTwo,
////            style: TextStyle(
////              color: Color(0xff999999),
////            ),
////          ),
////        ),
////      ],
////    );
////  }
////}