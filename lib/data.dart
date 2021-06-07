// Стандартные пакеты
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
// Модули приложения
import 'models/device.dart';


class Data with ChangeNotifier{
  Device currentDevice;
  IOWebSocketChannel channel;

  set device(Device device){
    currentDevice = device;
    notifyListeners(); 
  }

  // List<Song> currentPlaylist = [
  //   Song('Now That You\'re Gone', 'Father john Misty', 1),
  //   Song('The Only One', 'The Black Keys', 2),
  //   Song('Doing It To Death', 'The Kills', 3),
  //   Song('Doing It To Death', 'The Kills', 4),
  //   Song('Doing It To Death', 'The Kills', 5),
  //   Song('Doing It To Death', 'The Kills', 6),
  //   Song('Doing It To Death', 'The Kills', 7),
  //   Song('Doing It To Death', 'The Kills', 8),
  //   Song('Doing It To Death', 'The Kills', 9),
  // ];

  // List<Playlist> playlists = [
  //   Playlist("Nier Automata", "Никогда"),
  //   Playlist("Паровозик Томас", "Всегда"),
  //   Playlist("Аква дискотека", "12-12-2017"),
  //   Playlist("Комната грязи", "10-07-2016"),
  // ];

  // int currentSongPos = 2;
  
  // Status deviceStatus = Status();

  // Future moveSongInPlaylist(int currentPos, int newPos , String playlistName) async {
    
  // }
}