class Device {
  String name;
  String address;
  String profile;
  int authors;
  int albums;
  int songs;
  String time;
  String serverTime;
  String totalTime;
  String lastUpdated;

  Device({
    this.name,
    this.address,
    this.profile,
    this.authors,
    this.albums,
    this.songs,
    this.time,
    this.serverTime,
    this.totalTime,
    this.lastUpdated,
  });

  static List<Device> stubItems() {
    return [
      Device(
        name: 'Устройство 1',
        address: '880.255.35.35 : ka-3i-H0-777',
        profile: 'Example1.xml',
        authors: 11,
        albums: 9,
        songs: 17,
        time: '05:14',
        serverTime: '11',
        totalTime: '01:06:34',
        lastUpdated: '29 дек. 2020 г. 19:11:43',
      ),
      Device(
        name: 'Устройство 2',
        address: '180.255.35.35 : ka-3i-H0-777',
        profile: 'Example2.xml',
        authors: 22,
        albums: 5,
        songs: 20,
        time: '15:14',
        serverTime: '21',
        totalTime: '01:06:34',
        lastUpdated: '29 дек. 2020 г. 19:11:43',
      )
    ];
  }
}
