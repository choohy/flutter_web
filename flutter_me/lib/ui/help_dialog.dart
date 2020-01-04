//import 'package:flutter/material.dart';
//import 'package:flutter_me/blocs/help.dart';
//import 'package:flutter_me/models/help.dart';
//
//class HelpStream extends StatelessWidget {
//  final int index;
//
//  HelpStream({Key key, this.index}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    print('Help button pressed');
//    bloc.fetchAllHelp();
//    return StreamBuilder(
//      stream: bloc.allHelp,
//      builder: (context, AsyncSnapshot<HelpModel> snapshot) {
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
//              print('snapshot: $snapshot');
//
//
//              return HelpDialog(
//                snapshot: snapshot,
//                index: index,
//              );
//            }
//        }
//        print('Stream not found');
//        return Container();
//      },
//    );
//  }
//}
//
//class HelpDialog extends StatelessWidget {
//  final AsyncSnapshot<HelpModel> snapshot;
//
////  List<Help> help;
//  final int index;
//
//  HelpDialog({Key key, this.snapshot, this.index}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    Help currentHelp = snapshot.data.help.elementAt(index);
////    _snapshot = widget.snapshot;
////    print('Snapshot.data ${snapshot.data.help}');
////    help = snapshot.data.help;
////    List<String> _listItems =
////    help.map((i) => i.leaveType.pinNm).toList();
////    print('listItems: $_listItems');
////    List<String> _additionalInfo =
////    help.map((i) => "${i.days} days, ${i.hours} hours").toList();
////    print('additionalInfo: $_additionalInfo');
//
//    return AlertDialog(
//      title: new Text(currentHelp.title),
//      content: new Text(currentHelp.body),
//      actions: <Widget>[
//        // usually buttons at the bottom of the dialog
//        new FlatButton(
//          child: new Text(currentHelp.action),
//          onPressed: () {
//            Navigator.of(context).pop();
//          },
//        ),
//      ],
//    );
//  }
//}