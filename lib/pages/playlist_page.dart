import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nagaudio/models/menu_item.dart';
import 'package:nagaudio/models/playlist.dart';
import 'package:nagaudio/widgets/alert_menu_widget.dart';
import 'package:nagaudio/widgets/alert_textfield_widget.dart';

class PlaylistPage extends StatefulWidget {
  PlaylistPage({Key key, this.item}) : super(key: key);

  final Playlist item;

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  bool isRandom = false;
  bool isRepeat = false;

  Playlist item;

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  final playlistItems = Playlist.stubItems()
      .map((e) => MenuItem(
            e.name,
            Icons.playlist_play,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Аква-дискотека'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: item != null
                  ? ReorderableListView.builder(
                      // itemExtent: 60,
                      onReorder: (oldIndex, newIndex) {
                        setState(
                          () {
                            if (newIndex == 0) {
                              return;
                            }
                            oldIndex -= 1;
                            newIndex -= 1;
                            if (newIndex > oldIndex) {
                              newIndex = newIndex - 1;
                            }
                            final element = item.songs.removeAt(oldIndex);
                            item.songs.insert(newIndex, element);
                          },
                        );
                      },
                      padding: EdgeInsets.only(top: 0),
                      itemCount: item.songs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = this.item.songs[index];
                        return SizedBox(
                          key: ValueKey(item.songName),
                          height: 60,
                          child: Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            secondaryActions: <Widget>[
                              SlideAction(
                                child: Text(
                                  'Удалить',
                                  style: TextStyle(fontSize: 17),
                                ),
                                color: Colors.red[900],
                                onTap: () => print('Delete'),
                              ),
                            ],
                            child: ListTile(
                              title: Text(
                                item.songName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                item.singerName,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  final menuItems = [
                                    MenuItem('Добавить в очередь', Icons.add),
                                    MenuItem('Добавить в плейлист',
                                        Icons.playlist_add),
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
                                          final playlistItems =
                                              Playlist.stubItems()
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
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
