import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Card(
//          onPressed: () {
//            Navigator.pop(context);
//          },
          elevation: 5,
          child: Column(
            children: <Widget>[
              _name(context),
//              Text('Go back!'),
            ],
          ),
        ),
      ),
      floatingActionButton: RaisedButton.icon(
          onPressed: () {
            return Toast.show("Enter Edit mode.", context,
                duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
          },
          icon: Icon(Icons.edit_attributes),
          label: Text("Edit")),
    );
  }

  Widget _textFormField(String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _dropDownFormField(String label, String dropdownValue) {
    String _dropdownValue = 'Mr';
    List<String> _dropdownValues = <String>[
      '',
      'Mr',
      'Mrs',
      'Miss',
      'Ms',
      'Dr'
    ];

    return DropdownButtonFormField<String>(
      //return DropdownButton<String>(
      //value: dropdownValue,
      items: _dropdownValues
          .map((label) => DropdownMenuItem(
                child: Text(label),
                value: label,
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _dropdownValue = value;
        });
      },
      value: _dropdownValue,
    );
//    return new FormField(
//      builder: (FormFieldState state) {
//        return InputDecorator(
//          decoration: InputDecoration(
//            //icon: const Icon(Icons.color_lens),
//            labelText: label,
//          ),
//          isEmpty: _dropdownValue == '',
//          child: new DropdownButtonHideUnderline(
//            child: new DropdownButton(
//              value: _dropdownValue,
//              isDense: true,
//              onChanged: (String newValue) {
//                setState(() {
//                  //newContact.favoriteColor = newValue;
//                  _dropdownValue = newValue;
//                  //state.didChange(newValue);
//                });
//              },
//              items: _dropdownValues.map((String value) {
//                return new DropdownMenuItem(
//                  value: value,
//                  child: new Text(value),
//                );
//              }).toList(),
//            ),
//          ),
//        );
//      },
//    );
//      TextFormField(
//      decoration: InputDecoration(labelText: defaultValue)
//    );
//    DropdownButton<String>(
//      value: dropdownValue,
//      onChanged: (String newValue) {
//        setState(() {
//          dropdownValue = newValue;
//        });
//      },
//      items: <String>['Mr','Mrs', 'Miss', 'Ms', 'Dr']
//          .map<DropdownMenuItem<String>>((String value) {
//        return DropdownMenuItem<String>(
//          value: value,
//          child: Text(value),
//        );
//      }).toList(),
//    );
  }

  Widget _name(context) {
    final String prefix = "PREFIX";
    final String firstName = "FIRST NAME";
    final String middleName = "MIDDLE NAME";
    final String lastName = "LAST NAME";

    return Card(
      elevation: 3,
      child: Container(
        height: MediaQuery.of(context).size.width, //240.0,
        width: MediaQuery.of(context).size.width,
        child:
//          new DefaultTextStyle(style: new TextStyle(fontSize: 15.0), child:
            Column(
          children: <Widget>[
            _dropDownFormField(prefix, 'Mr'),
            //_textFormField(prefix),
            _textFormField(firstName),
            _textFormField(middleName),
            _textFormField(lastName),
          ],
        ),
      ),
    );
  }
}
