import 'package:flutter/material.dart';

class MusicActionsWidget extends StatelessWidget {
  const MusicActionsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.skip_previous,
            color: Colors.white,
            size: 80,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 80,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.skip_next,
            color: Colors.white,
            size: 80,
          ),
        ),
      ],
    );
  }
}
