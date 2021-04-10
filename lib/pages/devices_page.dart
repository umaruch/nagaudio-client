import 'package:flutter/material.dart';
import 'package:nagaudio/pages/device_properties.dart';

import 'package:nagaudio/models/device.dart';

class DevicesPage extends StatefulWidget {
  DevicesPage({Key key}) : super(key: key);

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  List<Device> items = Device.stubDevices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        // backgroundColor: Colors.grey[900],
        title: Row(
          children: [
            Text(
              'Найденные устройства',
              style: TextStyle(
                // color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return ListTile(
            leading: Icon(
              Icons.devices,
              color: Colors.white,
              size: 35,
            ),
            title: Text(
              item.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              item.address,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DeviceProperties(
                          item: item,
                        )),
              );
            },
          );
        },
      ),
    );
  }
}
