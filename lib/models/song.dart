class Song{
  String file;
  String lastModified;
  String artist;
  String title;
  String album;
  String duration;
  int pos;
  int id;

  Song(this.title, this.artist, this.id);

  Song.fromJSON(Map<String, dynamic> data){
    this.file = data["file"];
    this.lastModified = data["last-modified"];
    this.artist = data["artist"];
    this.title = data["title"];
    this.album = data["album"];
    this.duration = data["duration"];
    this.pos = data["pos"];
    this.id = data["id"];
  }
}