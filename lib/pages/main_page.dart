import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:provider/provider.dart';

import 'package:nagaudio/models/status.dart';
import 'package:nagaudio/models/song.dart';
import 'package:nagaudio/data.dart';
import 'components/manage_playlist_widget.dart';
import 'components/playlist_widget.dart';
import 'components/duration_widget.dart';
import 'components/music_actions_widget.dart';
import 'components/music_slider_widget.dart';
import 'package:nagaudio/pages/components/buttom_action_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Status status = Status();

  List<Song> currentPlaylist = [
    Song('Now That You\'re Gone', 'Father john Misty', 1),
    Song('The Only One', 'The Black Keys', 2),
    Song('Doing It To Death', 'The Kills', 3),
    Song('Doing It To Death', 'The Kills', 4),
    Song('Doing It To Death', 'The Kills', 5),
    Song('Doing It To Death', 'The Kills', 6),
    Song('Doing It To Death', 'The Kills', 7),
    Song('Doing It To Death', 'The Kills', 8),
    Song('Doing It To Death', 'The Kills', 9),
  ];

  IOWebSocketChannel channel;

  @override
  void initState() {
    String deviceIp =
        Provider.of<Data>(context, listen: false).currentDevice.ip;
    channel = IOWebSocketChannel.connect("ws://$deviceIp:5001");
    channel.stream.listen((event) {
      // TODO сделать обработку полученныйх данных и обновление виджета
      print(event);
      Map<String, dynamic> data = jsonDecode(event);
      print(data["type"]);
      if (data["type"] == "status") {
        print("LOl");
        setState(() {
          status.updatefromJSON(data["data"]);
          print(status.random);
        });
      } else if (data["type"] == "playlist") {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          constraints: BoxConstraints(maxWidth: 800),
          child: Column(
            children: <Widget>[
              // Пак виджетов плеера
              // Виджет с управлением текущим плейлистом
              ManageQueueWidget(status.random, status.repeat, status.single),
              // // Показ треков текущего списка воспроизведения
              TracksView(currentPlaylist, status.currentSongPos),
              // // Виджет управления временем трека
              DurationWidget(status.state, status.elapsed, status.duration),
              // // Управление воспроизведением
              MusicActionsWidget(),
              // // Управление звуком
              MusicSliderWidget(status.volume),

              // Пункты меню
              ButtomActionPanel()
            ],
          )),
    ));
  }
}
