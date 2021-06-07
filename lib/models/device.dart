import 'package:flutter/cupertino.dart';

class Device with ChangeNotifier{
  String name, ip, mac;

  Device(this.name, this.ip, this.mac);

  Device.fromJSON(Map<String, dynamic> data){
    this.name = data["device_name"];
    this.ip = data["ip_address"];
    this.mac = data["mac_address"];
  }
}