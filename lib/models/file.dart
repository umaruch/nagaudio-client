// import 'package:flutter/material.dart';

class File {
  // Элемент файловой системы

  String path; // Путь к файлу или директории
  bool isFile;
  Map<String, dynamic> information;

  File(this.path, this.isFile);

  File.fromJSON(Map<String, dynamic> data) {
    if (data.containsKey("file")) {
      this.isFile = true;
      this.path = data["file"];
      data.remove("file");
    } else {
      this.isFile = false;
      this.path = data["directory"];
      data.remove("directory");
    }
    this.information = data;
  }

  // Widget toWidget() {
  //   if (this.isFile) {
  //     return ListTile(
  //       leading: Icon(Icons.music_note, color: Colors.white, size: 35),
  //       title: Text(this.information['title'],
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           )),
  //       subtitle: Text(
  //         this.information['artist'],
  //         style: TextStyle(
  //           fontSize: 12,
  //         ),
  //       ),
  //     );
  //   } else {
  //     return ListTile(
  //       leading: Icon(Icons.folder, color: Colors.white, size: 35),
  //       title: Text(this.path,
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           )),
  //     );
  //   }
  // }
}
