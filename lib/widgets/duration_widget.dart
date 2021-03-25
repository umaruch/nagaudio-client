import 'package:flutter/material.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({
    Key key,
    @required this.durationSliderValue,
    @required this.timePassed,
    @required this.timeLeft,
  }) : super(key: key);

  final double durationSliderValue;
  final String timePassed;
  final String timeLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: durationSliderValue,
          min: 0,
          max: 100,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          onChangeEnd: (double value) {
            // setState(() {
            //   durationSliderValue = value;
            // });
          },
          onChanged: (value) {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                timePassed,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 13,
                ),
              ),
              Text(
                timeLeft,
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
