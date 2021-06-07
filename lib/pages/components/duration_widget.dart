import 'dart:async';
import 'package:flutter/material.dart';

import 'package:nagaudio/models/status.dart';

class DurationWidget extends StatefulWidget {
  String state;
  double elapsed, duration;
  DurationWidget(this.state, this.elapsed, this.duration);

  @override
  _DurationWidgetState createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<DurationWidget> {
  double elapsed = 0;
  double duration = 0;

  Future _updateState() async {
    Timer(Duration(seconds: 1), () {
      if (widget.state == "play") {
        // print("чето изменилось");
        setState(() {
          elapsed++;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    elapsed = widget.elapsed;
    duration = widget.duration;
    // _updateState();
    return Column(
      children: [
        Slider(
          value: elapsed,
          min: 0,
          max: duration,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          onChanged: (value) {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "$elapsed",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 13,
                ),
              ),
              Text(
                "$duration",
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
