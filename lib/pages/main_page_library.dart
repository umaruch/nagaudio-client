import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';

import 'package:nagaudio/models/playlist.dart';
import 'package:nagaudio/pages/widgets/playlist_menu.dart';
import 'playlist_page.dart';
// import 'package:nagaudio/pages/browser_page.dart';
import 'package:nagaudio/data.dart';

class MainPageLibrary extends StatefulWidget {
  MainPageLibrary({Key key}) : super(key: key);

  @override
  _MainPageLibraryState createState() => _MainPageLibraryState();
}

class _MainPageLibraryState extends State<MainPageLibrary> {
  bool _isUpdate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _updatePlaylists();
  }

  Future _updatePlaylists() async {
    // / Здесь будет происходить обновление списка плейлистов
    print("Типа обновление");

    setState(() {
      _isUpdate = true;
    });

    Timer(Duration(seconds: 5), () {
      setState(() {
        _isUpdate = false;
      });
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Playlist> _playlists = Provider.of<Data>(context).playlists;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Библиотека",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _updatePlaylists,
          child: Center(
            child: Column(
              children: <Widget>[
                _isUpdate
                    ? LinearProgressIndicator(backgroundColor: Colors.grey[900])
                    : Container(),
                Expanded(
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 800),
                      child: ListView.builder(
                          itemCount: _playlists.length + 1,
                          itemBuilder: (context, index) {
                            if (index == _playlists.length) {
                              return ListTile(
                                leading: Icon(Icons.folder,
                                    size: Theme.of(context).iconTheme.size,
                                    color: Theme.of(context).iconTheme.color),
                                title: Text("Проводник",
                                    style:
                                        Theme.of(context).textTheme.headline2),
                              );
                            }
                            return ListTile(
                              leading: Icon(Icons.playlist_play,
                                  size: Theme.of(context).iconTheme.size,
                                  color: Theme.of(context).iconTheme.color),
                              title: Text(_playlists[index].name,
                                  style: Theme.of(context).textTheme.headline2),
                              subtitle: Text(
                                _playlists[index].lastModified,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> PlaylistPage(_playlists[index])));
                              },

                              onLongPress: () {
                                PlaylistMenuWidget(_playlists[index])
                                    .show(context);
                              },
                            );
                          })),
                ),
              ],
            ),
          ),
        ));
  }
}
