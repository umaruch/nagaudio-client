import 'package:nagaudio/models/song.dart';

class Playlist {
  String name;
  List<Song> songs;
  Song currentSong;

  Playlist(this.name, this.songs, this.currentSong);

  static List<Playlist> stubItems() {
    return [
      Playlist(
        'Аква-дискотека',
        Song.stubItems(),
        Song('God\'s Favorite Customer', 'Father john Misty'),
      ),
      Playlist(
        'Комната грязи',
        Song.stubItems(),
        Song('God\'s Favorite Customer', 'Father john Misty'),
      ),
      Playlist(
        'Дворец в Италии',
        Song.stubItems(),
        Song('God\'s Favorite Customer', 'Father john Misty'),
      ),
    ];
  }
}
