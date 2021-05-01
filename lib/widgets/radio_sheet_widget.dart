import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RadioSheetWidget extends StatefulWidget {
  RadioSheetWidget({
    Key key,
    @required this.title,
    @required this.items,
    @required this.selectedItem,
    @required this.onChanged,
  }) : super(key: key);

  final String title;
  final List<String> items;
  final String selectedItem;
  final Function(String) onChanged;

  @override
  _RadioPageState createState() => _RadioPageState();

  show(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => this,
    );
  }
}

class _RadioPageState extends State<RadioSheetWidget> {
  String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      // height: (widget.items.length * 40 + 80).toDouble(),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...widget.items.map((e) {
              return Container(
                height: 40,
                child: RadioListTile(
                  value: e,
                  groupValue: selectedItem,
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                    widget.onChanged(value);
                  },
                  title: Text(
                    e,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedItem == e
                            ? Theme.of(context).accentColor
                            : Theme.of(context).textTheme.bodyText1.color),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              );
            }).toList(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
