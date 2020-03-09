import 'package:flutter/material.dart';
import '../ui/leave_balances_list.dart';
import '../ui/leave_history_list.dart';

class Leave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                _tabContainer(context, "BALANCES"),
                _tabContainer(context, "REQUESTS"),
                _tabContainer(context, "HISTORY"),
              ],
            ),
            title: Text('Leave'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(7.0),
            child: TabBarView(
              children: [
                //Balances
              LeaveBalancesWidget(),
                //Requests
//                Center(
//                  child: RaisedButton(
//                    onPressed: () {
//                      Navigator.pop(context);
//                    },
//                    child: Text('Go back!'),
//                  ),
//                ),
                //History
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go back!'),
                  ),
                ),
                LeaveHistoryWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabContainer(BuildContext context, String tabName) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      alignment: Alignment(-1.0, 0.0),
//                  height: MediaQuery.of(context).size.height / 7,
//      width: MediaQuery.of(context).size.width / 3,
      child: Text(tabName),
    );
  }
}