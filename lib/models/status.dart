class Status{
  // Статус воспроизведения
  double volume = 1;
  int repeat = 0;
  int random = 0;
  int single = 0;
  String state = "play";
  int currentSongPos, currentSongId = 0;
  double elapsed = 1.34, duration = 200.232;

  Status();

  void updatefromJSON(Map<String, dynamic> data){
    if(data.containsKey("volume")){
      this.volume =  double.parse(data["volume"])/100;
    }
    this.random = int.parse(data["random"]);
    this.repeat = int.parse(data["repeat"]);
    this.single = int.parse(data["single"]);
    this.state = data["state"];
    this.currentSongPos = int.parse(data["song"]);
    this.currentSongId = int.parse(data["songid"]);
    this.elapsed = double.parse(data["elapsed"]);
    this.duration = double.parse(data["duration"]); 
  }
}