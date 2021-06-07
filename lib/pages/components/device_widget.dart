import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../models/device.dart';
import 'package:nagaudio/data.dart';

class DeviceWidget extends StatelessWidget {
  final Device device;

  final Function onPressed;

  DeviceWidget({this.device, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.speaker,
          color: Theme.of(context).iconTheme.color,
          size: Theme.of(context).iconTheme.size),
      title: Text(device.name, style: Theme.of(context).textTheme.headline2),
      subtitle: Text(
        "${device.ip} ${device.mac}",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      onTap: () {
        Provider.of<Data>(context, listen: false).device = device;
        Navigator.pushNamed(context, "/main");
      },

    );
  }
}
