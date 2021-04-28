import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nagaudio/models/playlist.dart';

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
                                  return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 50),
                                        child: Dialog(
                                          backgroundColor: Colors.grey[850],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ), //this right here
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.grey[850],
                                            ),
                                            height: 120,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [],
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              icon: Icon(
                                                                  Icons.add),
                                                              color:
                                                                  Colors.grey,
                                                              iconSize: 25,
                                                              onPressed: () {},
                                                            ),
                                                            Text(
                                                              'Добавить в очередь',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                            Icons.playlist_add),
                                                        color: Colors.grey,
                                                        iconSize: 25,
                                                        onPressed: () {
                                                          return showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            50),
                                                                child: Dialog(
                                                                  backgroundColor:
                                                                      Colors.grey[
                                                                          850],
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ), //this right here
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)),
                                                                      color: Colors
                                                                              .grey[
                                                                          850],
                                                                    ),
                                                                    height: 190,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () {},
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.only(left: 12),
                                                                                      child: Text(
                                                                                        'Добавить в плейлист',
                                                                                        style: TextStyle(
                                                                                          fontSize: 20,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    IconButton(
                                                                                      icon: Icon(Icons.playlist_play),
                                                                                      color: Colors.grey,
                                                                                      iconSize: 25,
                                                                                      onPressed: () {},
                                                                                    ),
                                                                                    Text(
                                                                                      'Аква-дискотека',
                                                                                      style: TextStyle(
                                                                                        color: Colors.grey,
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              IconButton(
                                                                                icon: Icon(Icons.playlist_play),
                                                                                color: Colors.grey,
                                                                                iconSize: 25,
                                                                                onPressed: () {},
                                                                              ),
                                                                              Text(
                                                                                'Комната грязи',
                                                                                style: TextStyle(
                                                                                  color: Colors.grey,
                                                                                  fontSize: 18,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {},
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                IconButton(
                                                                                  icon: Icon(Icons.playlist_play),
                                                                                  color: Colors.grey,
                                                                                  iconSize: 25,
                                                                                  onPressed: null,
                                                                                ),
                                                                                Text(
                                                                                  'Дворец в Италии',
                                                                                  style: TextStyle(
                                                                                    color: Colors.grey,
                                                                                    fontSize: 18,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      Text(
                                                        'Добавить в плейлист',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
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
