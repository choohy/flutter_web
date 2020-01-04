import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_me/Navigation/leave.dart';
import 'package:flutter_me/Navigation/pay.dart';
import 'package:flutter_me/Navigation/profile.dart';
import 'package:flutter_me/Navigation/timesheet.dart';
//import 'package:flutter_webapp/Utility/ChatBot.dart';
//import 'package:flutter_webapp/ui/help_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter me',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Me@ANZ using Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> listItems = ['Leave', 'Pay', 'Timesheets'];//, 'ChatBot'];
  List<String> leaveLeft = [
    'LEAVE AVAILABLE',
    '2 DAYS, 3 HOURS',
    'AVAILABLE LEAVE'
  ];
  List<String> leaveRight = ['LEAVE BOOKED', '7 DAYS, 2 HOURS', ''];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _iconWidth = _width / 9;
    final _iconHeight = _height / 25;
    final String imgUrl =
        'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg';
//    final _primaryColor = Color(0xff115599);
//    final _secondaryColor = Colors.white;
//    final _thirdColor = Colors.grey;

    return new Stack(
      children: <Widget>[
        //new Container(color: Colors.blue,),
        new Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.9),
                //borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title),
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
//              actions: <Widget>[
//                IconButton(icon: Icon(Icons.search), onPressed: () {
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) {
//                        return ChatBot();
//                      })
//                  );
//                }),
//              ],
            ),
            drawer: new Drawer(
              child: new Container(),
            ),
            backgroundColor: Colors.transparent,
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      _rowProfileCell("EMPLOYEE", "1234567"),
                      new CircleAvatar(
                        radius: _width < _height ? _iconWidth : _iconHeight,
                        backgroundImage: NetworkImage(imgUrl),
                      ),
                      _rowProfileCell("LAN ID", "smithp"),
                    ],
                  ),
                  new SizedBox(
                    height: _height / 45.0,
                  ),
                  new Text(
                    'Peter Smith',
                    style: new TextStyle(
                      //fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.white),
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    child: Text(
                      'View profile',
                      style: new TextStyle(
                        fontSize: _width / 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  new Divider(
                    height: _height / 30,
                    color: Colors.white,
                  ),
                  new Expanded(
                    child:
//                  new SizedOverflowBox(
//                      size: Size(_width/2, _height/2),
//                      child: //new Text("hello"),
                    new ListView.builder(
                      itemCount: listItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                switch (index) {
                                  case 0:
                                      return Leave();
                                  case 1:
                                      return Pay();
                                  case 2:
                                      return TimesheetView();
//                                  case 3:
//                                    {
//                                      return ChatBot();
//                                    }
                                }
                                return new Text("Not built yet");
                              }
                              ),
                            );
                            // Navigate back to first route when tapped.
                          },
                          //leading: new Icon(Icons.android),
                          title: _buildTile(
                            index,
                            listItems[index],
                            _textTile(
                              leaveLeft[0],
                              leaveLeft[1],
                              leaveLeft[2],
                            ),
                            _textTile(
                              leaveRight[0],
                              leaveRight[1],
                              leaveRight[2],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget _buildTile(int index, String title, Widget left, Widget right) {
    return Card(
      elevation: 3,
      child: Container(
        height: 180.0,
        width: MediaQuery.of(context).size.width,
        child:
//          new DefaultTextStyle(style: new TextStyle(fontSize: 15.0), child:
        Column(
          children: <Widget>[
            new Align(
                alignment: Alignment.centerLeft,
                child:
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10),
                      child:  Text(
                        title,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          color: const Color(0xff115599),
                          fontSize: 30.0,
                        ),
                      ),
                    ),
//                    Container(
//                      child: IconButton(
//                        icon: Icon(Icons.help),
//                        color: Colors.blue,
//                        onPressed: () => _showDialog(index),
//                      ),
//                    )
                  ],
                )
            ),
            Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: left,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _textTile(String lineOne, String lineTwo, String lineThree) {
    return Column(
      children: <Widget>[
        new Text(
          lineOne,
          style: new TextStyle(
            color: Color(0xff115599),
          ),
        ),
        new Text(
          lineTwo,
          style: new TextStyle(
            color: Color(0xff999999),
          ),
        ),
        new Text(
          lineThree,
          style: new TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  // user defined function
//  void _showDialog(int index) {
//    // flutter defined function
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        print('Help button pressed, load values');
//        return HelpStream(index: index,);
//      },
//    );
//  }

  Widget _rowProfileCell(String stringOne, String stringTwo) => new Expanded(
      child: new Column(
        children: <Widget>[
          new Text(
            stringOne,
            style: new TextStyle(
              color: const Color(0xff115599),
              fontSize: 15.0,
            ),
          ),
          new Text(stringTwo,
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal))
        ],
      ));

}
