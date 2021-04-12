class Song {
  String songName;
  String singerName;

  Song(this.songName, this.singerName);

  static List<Song> stubItems() {
    return [
      Song('Now That You\'re Gone', 'Father john Misty'),
      Song('The Only One', 'The Black Keys'),
      Song('Doing It To Death', 'The Kills'),
    ];
  }
}
