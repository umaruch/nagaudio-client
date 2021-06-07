// Стандартные пакеты
import 'package:flutter/material.dart';
import 'dart:async';
// Установленные пакеты
// import 'package:provider/provider.dart';
// Модули приложения
import 'components/device_widget.dart';
import '../models/device.dart';
// import '../data.dart';

class DevicesPage extends StatefulWidget {
  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  
  bool _isSearch = false;

  // Тестовые данные
  List<Device> _devices = [
    Device("Test Device", "192.168.0.104", "AM34:3245:gfgs"),
    Device("Device2", "192.168.20.102", "AM34:3245:gfgs"),
    Device("Device3", "192.168.20.120", "AM34ds:3245:gfgs"),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Найденные устройства",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _updateDevices,
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800),
            child: ListView.builder(
                itemCount: _isSearch?_devices.length+1:_devices.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_isSearch && index==0) return LinearProgressIndicator(
                    backgroundColor: Colors.grey[900],
                  );
                  final device = _devices[_isSearch?index-1:index];
                  return DeviceWidget(
                    device: device,
                  );
                }
            )
          )
        )
      )
    );
  }


  Future _updateDevices() async {
    // Здесь будет происходить поиск устройств
    print("Типа обновление");

    setState(() {
      _isSearch = true;
    });

    Timer(Duration(seconds: 5), (){
      setState(() {
      _isSearch = false;
      });
      return null;
    });
  }
}
