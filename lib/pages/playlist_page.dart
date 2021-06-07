import 'package:flutter/material.dart';
import 'dart:async';

import 'package:nagaudio/pages/components/playlist_widget.dart';
import 'package:nagaudio/models/playlist.dart';

class PlaylistPage extends StatefulWidget {
  PlaylistPage(this._playlist);

  final Playlist _playlist;

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {

  bool _isUpdate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateTracks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._playlist.name,
              style: Theme.of(context).textTheme.headline1),
        ),
        body: RefreshIndicator(
          onRefresh: _updateTracks,
          child: Center(
            child: Column(
              children: <Widget>[
                _isUpdate
                    ? LinearProgressIndicator(backgroundColor: Colors.grey[900])
                    : Container(),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 800),

                    child: TracksView()
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future _updateTracks() async {
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
}
