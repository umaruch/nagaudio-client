import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:nagaudio/pages/widgets/track_menu.dart';
import 'package:nagaudio/models/song.dart';

class TrackMenuWidget extends StatelessWidget {
  final Song _track;

  TrackMenuWidget(this._track);

  show(BuildContext context) {
    showMaterialModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => this);
  }

  @override
  Widget build(BuildContext context) {
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
              title: Text(_track.title,
                  style: Theme.of(context).textTheme.headline3),
            ),

            // Сведения об устройстве
            ListTile(
              dense: true,
              title: Text(
                "Добавить в",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              leading: Icon(
                Icons.playlist_add,
                color: Colors.grey,
                size: 21,
              ),

              onTap: (){

              },

            ),

            // Настройки сети
            ListTile(
              dense: true,
              title: Text(
                "Удалить из",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              leading: Icon(
                Icons.delete,
                color: Colors.grey,
                size: 21,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
