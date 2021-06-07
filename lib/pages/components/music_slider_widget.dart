import 'package:flutter/material.dart';

import 'package:nagaudio/models/status.dart';

class MusicSliderWidget extends StatelessWidget {
  final double value;

  MusicSliderWidget(this.value);

  @override
  Widget build(BuildContext context) {
    print(value);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        
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
              value: value,
              min: 0,
              max: 1,
              activeColor: Colors.green[300],
              inactiveColor: Colors.grey,
              onChanged: (value) {
                
              },
            ),
          ),
          Icon(
            Icons.volume_up,
            color: Colors.white,
            size: 25,
          ),
        ],
      ),
    );
  }
}
