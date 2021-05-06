import 'package:flutter/material.dart';
import 'package:nagaudio/models/file.dart';
import 'package:nagaudio/models/menu_item.dart';
import 'package:nagaudio/models/playlist.dart';
import 'package:nagaudio/widgets/alert_menu_widget.dart';

class BrowserPage extends StatefulWidget {
  BrowserPage({Key key}) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  final playlistItems = Playlist.stubItems()
      .map((e) => MenuItem(
            e.name,
            Icons.playlist_play,
          ))
      .toList();

  List<File> items = File.stubItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Проводник'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemExtent: 50,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return ListTile(
              leading: Icon(
                (item.isFolder ? Icons.folder : Icons.music_note),
                color: Colors.white,
                size: 35,
              ),
              title: Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item.description,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              onTap: () {
                if (item.isFolder) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BrowserPage(),
                    ),
                  );
                } else {
                  final menuItems = [
                    MenuItem('Воспроизвести', Icons.play_arrow),
                    MenuItem('Добавить в очередь', Icons.add),
                    MenuItem('Добавить в плейлист', Icons.playlist_add),
                  ];
                  AlertMenuWidget(
                    title: null,
                    items: menuItems,
                    onSelected: (value) {
                      Navigator.of(context).pop();
                      final index = menuItems.indexOf(value);
                      switch (index) {
                        case 0:
                          break;
                        case 1:
                          break;
                        case 2:
                          final playlistItems = Playlist.stubItems()
                              .map((e) => MenuItem(
                                    e.name,
                                    Icons.playlist_play,
                                  ))
                              .toList();
                          AlertMenuWidget(
                            title: 'Добавить в плейлист',
                            items: playlistItems,
                            onSelected: (value) {
                              Navigator.of(context).pop();
                            },
                          ).show(context);
                          break;

                        default:
                      }
                    },
                  ).show(context);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
