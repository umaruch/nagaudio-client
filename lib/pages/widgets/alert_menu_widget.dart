import 'package:flutter/material.dart';
import 'package:nagaudio/models/menu_item.dart';

class AlertMenuWidget extends StatelessWidget {
  AlertMenuWidget({Key key, this.title, this.items, this.onSelected})
      : super(key: key);

  final String title;
  final List<MenuItem> items;
  final Function(MenuItem) onSelected;

  final _cornerRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_cornerRadius),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 10),
            if (title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ...items.map((e) {
              return Container(
                height: 40,
                child: ListTile(
                  minLeadingWidth: 20,
                  leading: Icon(
                    e.icon,
                    size: 25,
                  ),
                  title: Text(e.title),
                  onTap: () {
                    onSelected(e);
                  },
                ),
              );
            }).toList(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  show(BuildContext context) {
    showDialog(
      context: context,
      // backgroundColor: Colors.transparent,
      builder: (context) => this,
    );
  }
}
