import 'package:flutter/material.dart';

import 'package:nagaudio/pages/menu_page.dart';

class NetworkSettingsPage extends StatefulWidget {
  NetworkSettingsPage({Key key}) : super(key: key);

  @override
  _NetworkSettingsPageState createState() => _NetworkSettingsPageState();
}

class _NetworkSettingsPageState extends State<NetworkSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuPage()),
                      );
                    },
                  ),
                  Text(
                    'Сеть',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0,
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WIFI SSID',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[900],
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[900],
                          ),
                        ),
                        filled: true,
                        hintText: 'Имя сети',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        fillColor: Colors.black26,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[900],
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[900],
                          ),
                        ),
                        filled: true,
                        hintText: '******',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        fillColor: Colors.black26,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  Text(
                    'LAN IP (DHCP):',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '192.168.1.164',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
