import 'package:flutter/material.dart';

class MusicSliderWidget extends StatefulWidget {
  const MusicSliderWidget({
    Key key,
    @required this.soundSliderValue,
  }) : super(key: key);

  final double soundSliderValue;

  @override
  _MusicSliderWidgetState createState() => _MusicSliderWidgetState();
}

class _MusicSliderWidgetState extends State<MusicSliderWidget> {
  double soundValue = 0;
  @override
  void initState() {
    super.initState();
    soundValue = widget.soundSliderValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.volume_mute,
          color: Colors.white,
          size: 25,
        ),
        Expanded(
          child: Slider(
            value: soundValue,
            min: 0,
            max: 100,
            activeColor: Colors.green[300],
            inactiveColor: Colors.grey,
            onChanged: (value) {
              setState(() {
                soundValue = value;
              });
            },
          ),
        ),
        Icon(
          Icons.volume_up,
          color: Colors.white,
          size: 25,
        ),
      ],
    );
  }
}
