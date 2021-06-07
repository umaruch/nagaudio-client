class Playlist{
  String name, lastModified;

  Playlist(this.name, this.lastModified);

  Playlist.fromJSON(Map<String, dynamic> data){
    this.name = data["playlist"];
    this.lastModified = data["last-modified"];
  }
}