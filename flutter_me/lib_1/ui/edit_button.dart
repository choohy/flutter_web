import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class EditButton extends StatelessWidget {
  final Widget editWidget;

  const EditButton({Key key, this.editWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return IconButton(
        icon: const Icon(Icons.edit),
        iconSize: 20.0,
        tooltip: 'Edit',
        onPressed: () async {
          _navigateAndDisplaySelection(context);
          Toast.show("Enter Edit mode.", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
        });
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    print("Call editWidget: " + editWidget.toStringShort());

    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final Widget result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => editWidget),
    );

    print("EditWidget Results: $result");
  }
}
