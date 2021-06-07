import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DACProfileWidget extends StatefulWidget {

  final filterItems = [
    'Sharp Roll-Off',
    'Slow Roll-Off',
    'Short Delay Sharp Roll-Off',
    'Short Delay Slow Roll-Off Filter',
    'Super Slow Roll-Off Filter',
  ];

  @override
  _DACProfileWidgetState createState() => _DACProfileWidgetState();

  show(BuildContext context){
    showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => this
    );
  }
}

class _DACProfileWidgetState extends State<DACProfileWidget> {
  String _selectedItem = 'Sharp Roll-Off';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,

      padding: EdgeInsets.only(bottom: 30),

      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 3),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            // Заголовок окна
            ListTile(
              dense: true,
              title: Text(
                "ЦАП Фильтры",
                style: Theme.of(context).textTheme.headline3
              ),
            ),

            // Пункты меню 
            ...widget.filterItems.map((e) {
              return _selectedItem == e?ListTile(
                dense: true,
                title: Text(
                    e,
                    style: TextStyle(
                        fontSize: 21,
                        color:
                            Theme.of(context).accentColor
                        ),
                  ),
                trailing: Icon(
                  Icons.radio_button_on,
                  color: Theme.of(context).accentColor,
                  size: 21,
                ),
              ):ListTile(
                dense: true,
                title: Text(
                    e,
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.grey),
                  ),
                trailing: Icon(
                  Icons.radio_button_off,
                  color: Colors.grey,
                  size: 21,
                ),
                onTap: (){
                  setState(() {
                    _selectedItem = e;
                  });
                },
              );
            }).toList()

          ],
        ),
      ),
    );
  }
}