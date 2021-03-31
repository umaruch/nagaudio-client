import 'package:flutter/material.dart';

class DurationWidget extends StatefulWidget {
  DurationWidget({
    Key key,
    @required this.durationSliderValue,
    @required this.timePassed,
    @required this.timeLeft,
  }) : super(key: key);

  final double durationSliderValue;
  final String timePassed;
  final String timeLeft;

  @override
  _DurationWidgetState createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<DurationWidget> {
  double durationValue = 0;
  @override
  void initState() {
    super.initState();
    durationValue = widget.durationSliderValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: durationValue,
          min: 0,
          max: 100,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          onChanged: (value) {
            setState(() {
              durationValue = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.timePassed,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 13,
                ),
              ),
              Text(
                widget.timeLeft,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
