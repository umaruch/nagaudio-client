import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:nagaudio/models/playlist.dart';

class PlaylistMenuWidget extends StatelessWidget {
  final Playlist _playlist;

  PlaylistMenuWidget(this._playlist);

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
              title: Text(_playlist.name,
                  style: Theme.of(context).textTheme.headline3),
            ),

            // Сведения об устройстве
            ListTile(
              dense: true,
              title: Text(
                "Воспроизвести",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              leading: Icon(
                Icons.playlist_add,
                color: Colors.grey,
                size: 21,
              ),
            ),

            // Настройки сети
            ListTile(
              dense: true,
              title: Text(
                "Добавить в очередь",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              leading: Icon(
                Icons.add,
                color: Colors.grey,
                size: 21,
              ),
            ),

            // ЦАП фильтры
            ListTile(
              dense: true,
              title: Text(
                "Переименовать",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              leading: Icon(
                Icons.edit,
                color: Colors.grey,
                size: 21,
              ),
              onTap: () {
                _showRenameDialog(context);
              },
            ),

            // Поиск другого устройства
            ListTile(
              dense: true,
              title: Text(
                "Удалить",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              leading: Icon(
                Icons.delete,
                color: Colors.grey,
                size: 21,
              ),
              onTap: () {
                _showDeleteDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future _showDeleteDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), //this right here
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[850],
            ),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Удалить плейлист',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Text(
                            'Отмена',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text(
                            'Ок',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future _showRenameDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), //this right here
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[850],
            ),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Переименовать плейлист',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 1, horizontal: 5),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[800],
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[800],
                          ),
                        ),
                        filled: true,
                        hintText: 'Имя плейлиста',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.grey[800],
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Text(
                            'Отмена',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text(
                            'Сохранить',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
