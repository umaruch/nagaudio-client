import 'package:flutter/material.dart';
import 'package:nagaudio/models/device.dart';
import 'package:nagaudio/models/playlist.dart';
import 'package:nagaudio/pages/browser_page.dart';
import 'package:nagaudio/pages/device_properties.dart';
import 'package:nagaudio/pages/home_page.dart';
import 'package:nagaudio/pages/main_page.dart';
import 'package:nagaudio/pages/main_page_library.dart';

import 'package:nagaudio/pages/network_settings_page.dart';
import 'package:nagaudio/pages/playlist_page.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('Поиск и выбор устройств'),
                trailing: Icon(Icons.forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DevicesPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Главный экран'),
                trailing: Icon(Icons.forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage(
                              item: Playlist.stubItems().first,
                            )),
                  );
                },
              ),
              ListTile(
                title: Text('Меню медиа'),
                trailing: Icon(Icons.forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPageLibrary()),
                  );
                },
              ),
              ListTile(
                title: Text('Сведения об устройстве'),
                trailing: Icon(Icons.forward),
                onTap: () {
                  Device item = Device.stubItems().first;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceProperties(
                        item: item,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Настройки сетевого подключения'),
                trailing: Icon(Icons.forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NetworkSettingsPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Просмотр файловой системы'),
                trailing: Icon(Icons.forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BrowserPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Home'),
                trailing: Icon(Icons.forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              ListTile(
                title: Text('Просмотр плейлиста'),
                trailing: Icon(Icons.forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistPage(
                        item: Playlist.stubItems().first,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
