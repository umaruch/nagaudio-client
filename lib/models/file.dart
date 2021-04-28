class File {
  String title;
  String description;
  bool isFolder;

  File(this.title, this.description, this.isFolder);

  static List<File> stubItems() {
    return [
      File('Directory 4', '', true),
      File('The Only One', 'The Black Keys', false),
      File('Doing It To Death', 'The Kills', false),
    ];
  }
}
