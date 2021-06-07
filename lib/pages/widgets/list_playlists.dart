import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nagaudio/models/playlist.dart';
import 'package:nagaudio/data.dart';


class DACProfileWidget extends StatefulWidget {
  @override
  _DACProfileWidgetState createState() => _DACProfileWidgetState();

  show(BuildContext context){
    showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => this
    );
  }
}

class _DACProfileWidgetState extends State<DACProfileWidget> {

  @override
  Widget build(BuildContext context) {
    List<Playlist> _playlists = Provider.of<Data>(context).playlists;

    return Container(
      color: Theme.of(context).cardColor,

      padding: EdgeInsets.only(bottom: 30),

      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 3),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            // Заголовок окна
            ListTile(
              dense: true,
              title: Text(
                "Добавить в",
                style: Theme.of(context).textTheme.headline3
              ),
            ),

            // Пункты меню 
            ..._playlists.map((e) {
              return ListTile(
                dense: true,
                title: Text(
                    e.name,
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.grey),
                  ),
                leading: Icon(
                  Icons.playlist_play,
                  color: Colors.grey,
                  size: 21,
                ),
                onTap: (){
                },
              );
            }).toList()

          ],
        ),
      ),
    );
  }
}