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
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.skip_previous,
            size: 80,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.play_arrow,
            size: 80,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.skip_next,
            size: 80,
          ),
        ),
      ],
    );
  }
}
