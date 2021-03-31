import 'package:flutter/material.dart';

class BottomActionsWidget extends StatelessWidget {
  const BottomActionsWidget({
    Key key,
    this.onTabSelected,
  }) : super(key: key);

  final Function(int index) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            icon: Icon(
              Icons.format_list_bulleted,
              size: 28,
              color: Colors.grey,
            ),
            onPressed: () {
              onTabSelected(0);
            }),
        IconButton(
          icon: Icon(
            Icons.settings_input_component,
            size: 28,
            color: Colors.grey,
          ),
          onPressed: () {
            onTabSelected(1);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.leaderboard,
            size: 28,
            color: Colors.grey,
          ),
          onPressed: () {
            onTabSelected(2);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            size: 28,
            color: Colors.grey,
          ),
          onPressed: () {
            onTabSelected(3);
          },
        ),
      ],
    );
  }
}
