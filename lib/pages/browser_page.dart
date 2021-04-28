import 'package:flutter/material.dart';
import 'package:nagaudio/models/file.dart';

class BrowserPage extends StatefulWidget {
  BrowserPage({Key key}) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
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
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Dialog(
                          backgroundColor: Colors.grey[850],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ), //this right here
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey[850],
                            ),
                            height: 170,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                              icon: Icon(Icons.play_arrow),
                                              color: Colors.grey,
                                              iconSize: 25,
                                              onPressed: () {},
                                            ),
                                            Text(
                                              'Воспроизвести',
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
                                        icon: Icon(Icons.add),
                                        color: Colors.grey,
                                        iconSize: 25,
                                        onPressed: () {},
                                      ),
                                      Text(
                                        'Добавить в очередь',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 50),
                                            child: Dialog(
                                              backgroundColor: Colors.grey[850],
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ), //this right here
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.grey[850],
                                                ),
                                                height: 190,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 12),
                                                                  child: Text(
                                                                    'Добавить в плейлист',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                IconButton(
                                                                  icon: Icon(Icons
                                                                      .playlist_play),
                                                                  color: Colors
                                                                      .grey,
                                                                  iconSize: 25,
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                                Text(
                                                                  'Аква-дискотека',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        18,
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
                                                            icon: Icon(Icons
                                                                .playlist_play),
                                                            color: Colors.grey,
                                                            iconSize: 25,
                                                            onPressed: () {},
                                                          ),
                                                          Text(
                                                            'Комната грязи',
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
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Row(
                                                          children: [
                                                            IconButton(
                                                              icon: Icon(Icons
                                                                  .playlist_play),
                                                              color:
                                                                  Colors.grey,
                                                              iconSize: 25,
                                                              onPressed: null,
                                                            ),
                                                            Text(
                                                              'Дворец в Италии',
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
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.playlist_add),
                                          color: Colors.grey,
                                          iconSize: 25,
                                          onPressed: () {},
                                        ),
                                        Text(
                                          'Добавить в плейлист',
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
                }
              },
            );
          },
        ),
      ),
    );
  }
}
